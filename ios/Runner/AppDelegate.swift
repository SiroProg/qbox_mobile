import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


// import UIKit
// import Flutter
// import UserNotifications

// @main
// @objc class AppDelegate: FlutterAppDelegate {
    
//     override func application(
//         _ application: UIApplication,
//         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//     ) -> Bool {
//         // Configure notification settings
//         if #available(iOS 10.0, *) {
//             UNUserNotificationCenter.current().delegate = self
//         }
        
//         // Call the super implementation
//         return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//     }

//     // Override methods if necessary
//     override func application(
//         _ application: UIApplication,
//         open url: URL,
//         options: [UIApplication.OpenURLOptionsKey : Any] = [:]
//     ) -> Bool {
//         // Handle URL opening
//         return super.application(application, open: url, options: options)
//     }

//     override func application(
//         _ application: UIApplication,
//         didReceive notification: UILocalNotification
//     ) {
//         // Handle local notification
//         super.application(application, didReceive: notification)
//     }
// }