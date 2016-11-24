//
//  Token.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation
import Gloss

public struct Token : Decodable {
    public let accessToken:String
    public let expiresIn:Int
    public let tokenType:String
    public let refreshToken:String
    
    public init?(json: JSON) {
        guard let accessToken: String = "access_token" <~~ json else {
            return nil
        }
        self.accessToken = accessToken
        
        guard let expiresIn: Int = "expires_in" <~~ json else {
            return nil
        }
        self.expiresIn = expiresIn
        
        guard let tokenType: String = "token_type" <~~ json else {
            return nil
        }
        self.tokenType = tokenType
        
        guard let refreshToken: String = "refresh_token" <~~ json else {
            return nil
        }
        self.refreshToken = refreshToken
    }
}
