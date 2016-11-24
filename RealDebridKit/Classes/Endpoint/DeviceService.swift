//
//  DeviceService.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation
import Alamofire

public class DeviceService : BaseService {
    
    public class CodeService : BaseService {
        
        public init(clientId:String) {
            super.init()
            self.parameters["client_id"] = clientId
        }
        
        public convenience init(clientId:String, newCredentials:Bool) {
            if(newCredentials) {
                self.init(clientId: clientId)
                self.parameters["new_credentials"] = "yes"
            } else {
                self.init(clientId: clientId)
            }
        }
        
        public override func perform(complete: @escaping (Any?, ErrorCode?) -> Void) {
            let request:DataRequest = Alamofire.request(RealDebrid.OAUTH_URL+"/device/code", method: .get, parameters: self.parameters)
            
            request.responseJSON { (response) in
                print(response)
                if let json = response.result.value as? Dictionary<String, Any> {
                    if let code = Device.Code(json: json) {
                        complete(code, nil)
                    } else {
                        let err = Error(json: json)
                        complete(err, err.errorCode)
                    }
                    
                }
            }
        }
    }
    
    public class CredentialsService : BaseService {
        
        public init(clientId:String, code:String) {
            super.init()
            self.parameters["client_id"] = clientId
            self.parameters["code"] = code
        }
        
        public override func perform(complete: @escaping (Any?, ErrorCode?) -> Void) {
            let request:DataRequest = Alamofire.request(RealDebrid.OAUTH_URL+"/device/credentials", method: .get, parameters: self.parameters)
            
            request.responseJSON { (response) in

                if let json = response.result.value as? Dictionary<String, Any> {
                    if let cred = Device.Credentials(json: json) {
                        complete(cred, nil)
                    } else {
                        let err = Error(json: json)
                        complete(err, err.errorCode)
                    }
                    
                }
            }
        }
    }
}
