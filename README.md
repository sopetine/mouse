# Mouse

A tiny free, open-source Mac menu bar app that nudges your cursor every 30 seconds — so your Mac stays awake and your status stays green.

**100% free, forever. MIT licensed. No accounts. No tracking. 1.4 MB.**

> *"Look alive. Even when you're not."*

## Download

Grab the latest DMG:

[**Download Mouse-1.0.dmg**](./downloads/Mouse-1.0.dmg)

Or build from source (one file, 72 lines):

```bash
git clone https://github.com/sopetine/mouse.git
cd mouse
swiftc main.swift -o MouseJiggler.app/Contents/MacOS/MouseJiggler
codesign --force --deep -s - MouseJiggler.app
open MouseJiggler.app
```

## Install

1. Download `Mouse-1.0.dmg`
2. Open the DMG
3. Drag **Mouse** to your **Applications** folder
4. Eject the DMG
5. Open **Mouse** from Applications — it lives in your menu bar
6. Click the icon → **Active** to enable, **Quit** to close

> No permissions requested. No Accessibility. No screen recording. No analytics.

## What it does

Watches your input. If you haven't moved the mouse or pressed a key for 30 seconds, it nudges the cursor by 1 pixel (back and forth, alternating direction) so macOS thinks you're active. That's it. That's the whole trick.

When you start typing or moving again, it stays out of the way.

## Why

- Long downloads? Stay awake without `caffeinate`.
- Boring meeting on mute? Look alert on Slack/Teams.
- Watching a 90-min training? Screen won't lock.
- WFH lunch break? Boss won't see you as *Away*.

## The mascot

The mascot is a slightly-anxious cursor. Its pupils follow your real mouse. Blink occasionally. Smile anyway. Like the rest of us.

## License

MIT — see [LICENSE](./LICENSE).

---

Made for Mac, with ❤️ and an anxious cursor.
