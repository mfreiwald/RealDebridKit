//
//  TokenEP.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation
import Alamofire

public enum GrandType :String {
    case Password = "password"
}
public class TokenEP {
    
    let client_id:String
    let username:String
    let password:String
    let grand_type:GrandType
    
    init(clientId:String, username:String, password:String, grandType:GrandType) {
        self.client_id = clientId
        self.username = username
        self.password = password
        self.grand_type = grandType
    }
    
    /*
    let parameters: Parameters = [
        "client_id": link,
        "password": password
    ]
    */
}
