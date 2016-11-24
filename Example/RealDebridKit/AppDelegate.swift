//
//  AppDelegate.swift
//  RealDebridKit
//
//  Created by Michael Freiwald on 11/20/2016.
//  Copyright (c) 2016 Michael Freiwald. All rights reserved.
//

import UIKit
import RealDebridKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var clientId:String = ""
    var clientSecret:String = ""
    
    func test(service:DeviceService.CredentialsService) {
        service.perform(complete: { (creden, error) in
            if let _ = error {
                print(error!)
                sleep(5)
                self.test(service: service)
            } else {
                if let credObj = creden as? Device.Credentials {
                    self.clientId = credObj.clientId
                    self.clientSecret = credObj.clientSecret
                    
                    print("Successful Authenticated!")
                    
                }
            }
        })
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let codeService = DeviceService.CodeService(clientId: RealDebrid.DEFAULT_CLIENT_ID, newCredentials: true)
        codeService.perform { (code, error) in
            if let _ = error {
                print(error)
            } else {
                if let codeObj = code as? Device.Code {

                    print("Open Browser at:\n" + codeObj.directVerificationUrl)
                    
                    sleep(5)
                    
                    let credService = DeviceService.CredentialsService(clientId: RealDebrid.DEFAULT_CLIENT_ID, code: codeObj.deviceCode)
                    self.test(service: credService)
                
                }
            }
        }
        
        
        /*
        RealDebrid.provideAPIToken(token: "")
        
        RealDebrid.getUser { (user) in
            if let _ = user {
                print(user!.username)
            } else {
                print("user is nil")
            }
        }
        
        RealDebrid.unrestrictCheck(link: "http://uploaded.net/file/h19ql01d", password: "", completion: {(link) in
            if let _ = link {
                print(link!.filename)
            }
        })
        */
        /*
        if let fileURL = Bundle.main.url(forResource: "mm", withExtension: "dlc") {
            RealDebrid.unrestrictContainerFile(fileURL: fileURL, completion: {(urls) in
                guard urls != nil else {
                    print("Fehler")
                    return
                }

                RealDebrid.unrestrictLink(link: urls!.first!, completion: { (link) in
                    if let _ = link {
                        print(link!.download)
                        print(link!.filename)
                        print(link!.filesize)
                    }
                })
            })
        }
        */
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

