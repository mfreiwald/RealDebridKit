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
    
    public override func perform(complete: @escaping (Any?, ErrorCode?) -> Void) {
        let request:DataRequest = Alamofire.request(RealDebrid.REST_URL+"/user", method: .get, parameters: self.parameters, headers: self.headers)
        
        request.responseJSON { (response) in
            request.responseJSON { (response) in
                if let json = response.result.value as? Dictionary<String, Any> {
                    if let user = User(json: json) {
                        complete(user, nil)
                    } else {
                        let err = Error(json: json)
                        complete(err, err.errorCode)
                    }
                    
                }
            }
        }
    }
}
