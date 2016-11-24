//
//  Authentication.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation

class Authentication {
    
    // To Store
    var clientId:String?
    var clientSecret:String?
    var accessToken:String?
    var refreshToken:String?
    
    
    func getNewAccessToken() {
        
    }
    
}

public enum GrandType :String {
    case Password = "password"
    case Device = "http://oauth.net/grant_type/device/1.0"
}
