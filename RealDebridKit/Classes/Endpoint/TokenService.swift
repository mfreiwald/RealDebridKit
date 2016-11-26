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
    
    override var url: String {
        return RealDebrid.OAUTH_URL+"/token"
    }
    
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
    
    public override func perform(completion: @escaping (Any?) -> Void) {
        createRequest(method: .post).responseJSON { (response) in
            if let json = response.result.value as? Dictionary<String, Any> {
                completion(Token(json: json) ?? RDError(json: json))
            } else {
                completion(RDError(code: ErrorCode.JsonReadError))
            }
        }
    }

}
