import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let CHANNEL = FlutterMethodChannel(name:"flutter.native/helper",binaryMessenger:controller as! FlutterBinaryMessenger)
    
    CHANNEL.setMethodCallHandler {
        
        [unowned self] (methodCall, result ) in
        
        if methodCall.method == "helloFromNativeCode"
        {
            
            result("hello from swfit")
        }
        
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
