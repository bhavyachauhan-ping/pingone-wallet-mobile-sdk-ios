//
//  AppInfoUtils.swift
//  PingOneWallet
//
//

import UIKit

class AppInfoUtils {
    
    public static let START_POLLING = "start polling"
    public static let STOP_POLLING = "stop polling"
    public static let ENABLE_PUSH = "enable push"
    public static let DISABLE_PUSH = "disable push"
    public static let DELETE_CREDS = "delete creds"
    
    static func getAppInfoMessageFor(applicationInstances: [String: String]) -> String {
        var message = "Version: \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Not available")"
        if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            message.append(" (\(buildNumber))")
        }
        message.append("\n--------------------------")
        var appInstanceMessage = ""
        applicationInstances.forEach { (key: String, value: String) in
            appInstanceMessage.append("\n* URL: \(key)\n* ID: \(value)")
        }
        message.append("\(appInstanceMessage)\n--------------------------")
        let pushToken: String? = (UIApplication.shared.delegate as? AppDelegate)?.pnToken?.hexDescription
        
        if let pnToken = pushToken {
            message.append("\n* Push Token: \(pnToken)")
        }
        
        return message
    }
    
}
