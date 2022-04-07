//
//  NFLGuesserApp.swift
//  NFL Guesser
//
//  Created by Ryan Prince on 3/31/22.
//

import AWSCore
import SwiftUI

@main
struct NFL_GuesserApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        guard let accessKey = Bundle.main.infoDictionary?["ACCESS_KEY"] as? String else { return false }
        guard let secretKey = Bundle.main.infoDictionary?["SECRET_KEY"] as? String else { return false }
        
        let provider: AWSCredentialsProvider = AWSStaticCredentialsProvider(
                                                accessKey: accessKey,
                                                secretKey: secretKey)
        
        let configuration = AWSServiceConfiguration(region: .USEast1,
                                                    credentialsProvider: provider)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        return true
    }
}
