# Mouse · build & install

Tiny macOS menu bar app that nudges the cursor every 30 s so your Mac stays awake.

## Build

```bash
swiftc main.swift -o MouseJiggler.app/Contents/MacOS/MouseJiggler
codesign --force --deep -s - MouseJiggler.app
```

## Run

```bash
open MouseJiggler.app
```

Right-click the menu bar icon → **Active** to toggle on/off, **Quit** to exit.

## Package as DMG

```bash
hdiutil create -volname "Mouse" -srcfolder MouseJiggler.app \
  -ov -format UDZO downloads/Mouse-1.0.dmg
```

## Source

One file. 72 lines. [`main.swift`](./main.swift).
