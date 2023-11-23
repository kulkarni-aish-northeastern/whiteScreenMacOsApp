import Cocoa

class CustomContentView: NSView {

    var isHovered: Bool = false

    override var wantsUpdateLayer: Bool {
        return true
    }

    override func updateLayer() {
        // Add a border inside the view
        self.layer?.borderColor = (isHovered ? NSColor.red : NSColor.black).cgColor
        self.layer?.borderWidth = 2.0
        self.layer?.cornerRadius = 8.0
    }

    override func mouseEntered(with event: NSEvent) {
        isHovered = true
        self.needsDisplay = true
    }

    override func mouseExited(with event: NSEvent) {
        isHovered = false
        self.needsDisplay = true
    }

    override func resize(withOldSuperviewSize oldSize: NSSize) {
        super.resize(withOldSuperviewSize: oldSize)
        self.needsDisplay = true
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let frame = NSRect(x: 0, y: 0, width: 800, height: 600)
        window = NSWindow(
            contentRect: frame,
            styleMask: [.titled, .closable, .resizable, .fullSizeContentView, .miniaturizable],
            backing: .buffered,
            defer: false
        )
        window.isOpaque = true
        window.backgroundColor = NSColor.white

        window.level = .statusBar
        window.ignoresMouseEvents = false
        window.hasShadow = false
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenPrimary]

        let contentView = CustomContentView(frame: frame)

        // Add tracking area for hover effect
        let trackingArea = NSTrackingArea(rect: contentView.bounds, options: [.activeAlways, .mouseEnteredAndExited], owner: contentView, userInfo: nil)
        contentView.addTrackingArea(trackingArea)

        window.contentView = contentView

        window.makeKeyAndOrderFront(nil)

        NSApp.activate(ignoringOtherApps: true)
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if !flag {
            window.makeKeyAndOrderFront(self)
        }
        return true
    }

    func windowDidResize(_ notification: Notification) {
        if let contentView = window.contentView as? CustomContentView {
            contentView.needsDisplay = true
        }
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run()
