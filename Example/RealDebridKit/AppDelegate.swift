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

    var deviceCode:String {
        get {
            return UserDefaults.standard.string(forKey: "deviceCode") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "deviceCode")
        }
    }
    var clientId:String {
        get {
            return UserDefaults.standard.string(forKey: "clientId") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "clientId")
        }
    }
    var clientSecret:String {
        get {
            return UserDefaults.standard.string(forKey: "clientSecret") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "clientSecret")
        }
    }
    var authToken:String {
        get {
            return UserDefaults.standard.string(forKey: "authToken") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "authToken")
        }
    }
    
    func test(service:DeviceService.Credentials) {
        service.perform { (data) in
            guard let cred = data as? Device.Credentials else {
                print(data as! RDError)
                sleep(5)
                self.test(service: service)
                return
            }

            self.clientId = cred.clientId
            self.clientSecret = cred.clientSecret
            
            print("Successful Authenticated!")
                    
            TokenService(clientId: self.clientId, clientSecret: self.clientSecret, code: self.deviceCode).perform { (data) in
                guard let token = data as? Token else {
                    print(data as! RDError)
                    return
                }
                
                print("AccessToken: "+token.accessToken)
                self.authToken = token.accessToken
                
                self.showUser()
            }
        }
    }
    
    func showUser() {
        UserService(authToken: self.authToken).perform { (data) in
            guard let user = data as? User else {
                print(data as! RDError)
                return
            }
            print("Username: " + user.username)
        }
    }
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        
        
        
        
        
        if(self.authToken == "") {
        
        let codeService = DeviceService.Code(clientId: RealDebrid.DEFAULT_CLIENT_ID, newCredentials: true)
        codeService.perform { (data) in
            guard let code = data as? Device.Code else {
                print(data as! RDError)
                return
            }
            

            self.deviceCode = code.deviceCode
            print("Open Browser at:\n" + code.directVerificationUrl)
                    
            sleep(5)
                    
            let credService = DeviceService.Credentials(clientId: RealDebrid.DEFAULT_CLIENT_ID, code: code.deviceCode)
            self.test(service: credService)
            }
        } else {
        
            showUser()
        }
        
        
        /*
        UnrestrictService.Check(link: "http://uploaded.net/file/h19ql01d").perform { (data) in
            guard let check = data as? Unrestrict.Check else {
                print(data as! RDError)
                return
            }
            print(check.filename)
        }
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

