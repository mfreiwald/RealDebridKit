//
//  User.swift
//  Pods
//
//  Created by Michael Freiwald on 21.11.16.
//
//

import Foundation
import Gloss

public struct User : Decodable {
    public let id:Int
    public let username:String
    public let email:String
    public let points:Int
    public let locale:String
    public let avatar:String
    public let type:String
    public let premium:Int
    public let expiration:String
    
    public init?(json: JSON) {
        guard let id: Int = "id" <~~ json else {
            return nil
        }
        guard let username: String = "username" <~~ json else {
            return nil
        }
        guard let email: String = "email" <~~ json else {
            return nil
        }
        guard let points: Int = "points" <~~ json else {
            return nil
        }
        guard let locale: String = "locale" <~~ json else {
            return nil
        }
        guard let avatar: String = "avatar" <~~ json else {
            return nil
        }
        guard let type: String = "type" <~~ json else {
            return nil
        }
        guard let premium: Int = "premium" <~~ json else {
            return nil
        }
        guard let expiration: String = "expiration" <~~ json else {
            return nil
        }
        
        self.id = id
        self.username = username
        self.email = email
        self.points = points
        self.locale = locale
        self.avatar = avatar
        self.type = type
        self.premium = premium
        self.expiration = expiration

    }

}
