import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = NSMakeRect(0, 0, 1920, 1080) // Genişlik x Yükseklik
    self.contentViewController = flutterViewController
    self.minSize = NSSize(width: 1920, height: 1080)
    self.setFrame(windowFrame, display: true)
    self.center()

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
