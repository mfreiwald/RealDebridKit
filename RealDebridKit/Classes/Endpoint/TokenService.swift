//
//  TokenEP.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation
import Alamofire


public class TokenService : BaseService {
    
    init(clientId:String, clientSecret:String, code:String, grandType:GrandType) {
        super.init()
        self.parameters = [
            "client_id" : clientId,
            "client_secret" : clientSecret,
            "code" : code,
            "grand_type" : grandType.rawValue
        ]
    }

}
