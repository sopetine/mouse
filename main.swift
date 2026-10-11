import Cocoa
import CoreGraphics

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var timer: Timer?
    var isEnabled = true
    var jiggleDirection: CGFloat = 1

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        updateIcon()

        let menu = NSMenu()
        let toggleItem = NSMenuItem(title: "Active", action: #selector(toggleEnabled), keyEquivalent: "")
        toggleItem.state = .on
        toggleItem.tag = 1
        menu.addItem(toggleItem)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }

    func updateIcon() {
        if let button = statusItem.button {
            let name = isEnabled ? "computermouse.fill" : "computermouse"
            button.image = NSImage(systemSymbolName: name, accessibilityDescription: "MouseJiggler")
            button.image?.isTemplate = true
        }
    }

    @objc func toggleEnabled(_ sender: NSMenuItem) {
        isEnabled.toggle()
        sender.state = isEnabled ? .on : .off
        updateIcon()
    }

    func tick() {
        guard isEnabled else { return }

        let mouseSince = CGEventSource.secondsSinceLastEventType(.combinedSessionState, eventType: .mouseMoved)
        let keySince = CGEventSource.secondsSinceLastEventType(.combinedSessionState, eventType: .keyDown)
        let idle = min(mouseSince, keySince)

        guard idle >= 30 else { return }

        guard let current = CGEvent(source: nil) else { return }
        let pos = current.location

        let nudged = CGPoint(x: pos.x + jiggleDirection, y: pos.y)
        if let e1 = CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: nudged, mouseButton: .left) {
            e1.post(tap: .cghidEventTap)
        }

        let back = CGPoint(x: pos.x, y: pos.y)
        if let e2 = CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: back, mouseButton: .left) {
            e2.post(tap: .cghidEventTap)
        }

        jiggleDirection *= -1
    }
}

let app = NSApplication.shared
app.setActivationPolicy(.accessory)
let delegate = AppDelegate()
app.delegate = delegate
app.run()
