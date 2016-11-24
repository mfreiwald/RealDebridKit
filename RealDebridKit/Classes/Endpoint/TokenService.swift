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
    
    public init(clientId:String, clientSecret:String, code:String) {
        super.init()
        self.parameters = [
            "client_id" : clientId,
            "client_secret" : clientSecret,
            "code" : code,
            "grant_type" : GrandType.Device.rawValue
        ]
    }
    
    public init(clientId:String, username:String, password:String) {
        super.init()
        self.parameters = [
            "client_id" : clientId,
            "username" : username,
            "password" : password,
            "grant_type" : GrandType.Password.rawValue
        ]
    }
    
    public override func perform(complete: @escaping (Any?, ErrorCode?) -> Void) {
        let request:DataRequest = Alamofire.request(RealDebrid.OAUTH_URL+"/token", method: .post, parameters: self.parameters)
        request.responseJSON { (response) in
            print("TokenService")
            print(" \(self.parameters)")
            print(" \(response.request!.url!)")
            print(" \(response)")
            if let json = response.result.value as? Dictionary<String, Any> {
                if let token = Token(json: json) {
                    complete(token, nil)
                } else {
                    let err = Error(json: json)
                    complete(err, err.errorCode)
                }
                
            }
        }
    }

}
