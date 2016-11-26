//
//  UserService.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation
import Alamofire

public class UserService : AuthenticatedService {
    
    override var url: String {
        return RealDebrid.REST_URL+"/user"
    }
    
    public override func perform(completion: @escaping (Any?) -> Void) {
        createRequest(method: .get).responseJSON { (response) in
            if let json = response.result.value as? Dictionary<String, Any> {
                completion(User(json: json) ?? RDError(json: json))
            } else {
                completion(RDError(code: ErrorCode.JsonReadError))
            }
        }
    }
    
}
