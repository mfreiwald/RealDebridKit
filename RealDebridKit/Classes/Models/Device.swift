//
//  Device.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation
import Gloss

public class Device {
    
    public struct Code : Decodable {
        let deviceCode:String
        let userCode:String
        let interval:Int
        let expiresIn:Int
        let verificationUrl:String
        let directVerificationUrl:String
        
        public init?(json: JSON) {
            guard let deviceCode: String = "device_code" <~~ json else {
                return nil
            }
            self.deviceCode = deviceCode
            
            guard let userCode: String = "user_code" <~~ json else {
                return nil
            }
            self.userCode = userCode
            
            guard let interval: Int = "interval" <~~ json else {
                return nil
            }
            self.interval = interval
            
            guard let expiresIn: Int = "expires in" <~~ json else {
                return nil
            }
            self.expiresIn = expiresIn
            
            guard let verificationUrl: String = "verification_url" <~~ json else {
                return nil
            }
            self.verificationUrl = verificationUrl
            
            guard let directVerificationUrl: String = "direct_verification_url" <~~ json else {
                return nil
            }
            self.directVerificationUrl = directVerificationUrl
        }
    }
    
    public struct Credentials : Decodable {
        let clientId:String
        let clientSecret:String
        
        public init?(json: JSON) {
            guard let clientId: String = "client_id" <~~ json else {
                return nil
            }
            self.clientId = clientId
            
            guard let clientSecret: String = "client_secret" <~~ json else {
                return nil
            }
            self.clientSecret = clientSecret
        }
    }
    
}
