import Cocoa

class CustomContentView: NSView {
    override func resize(withOldSuperviewSize oldSize: NSSize) {
        super.resize(withOldSuperviewSize: oldSize)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let frame = NSRect(x: 0, y: 0, width: 800, height: 600)
        window = NSWindow(
            contentRect: frame,
            styleMask: [.titled, .closable, .resizable, .fullSizeContentView],
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
        window.contentView = contentView

        window.makeKeyAndOrderFront(nil)

        NSApp.activate(ignoringOtherApps: true)
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run()
