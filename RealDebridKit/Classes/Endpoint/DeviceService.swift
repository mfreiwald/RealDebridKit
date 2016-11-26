//
//  DeviceService.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation
import Alamofire

public struct DeviceService {
    
    public class Code : BaseService {
        
        override var url: String {
            return RealDebrid.OAUTH_URL+"/device/code"
        }
        
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
        
        public override func perform(completion: @escaping (Any?) -> Void) {
            createRequest(method: .get).responseJSON { (response) in
                if let json = response.result.value as? Dictionary<String, Any> {
                    completion(Device.Code(json: json) ?? RDError(json: json))
                } else {
                    completion(RDError(code: ErrorCode.JsonReadError))
                }
            }
        }
    }
    
    public class Credentials : BaseService {
        
        override var url: String {
            return RealDebrid.OAUTH_URL+"/device/credentials"
        }
        
        public init(clientId:String, code:String) {
            super.init()
            self.parameters["client_id"] = clientId
            self.parameters["code"] = code
        }
        
        public override func perform(completion: @escaping (Any?) -> Void) {
            createRequest(method: .get).responseJSON { (response) in
                if let json = response.result.value as? Dictionary<String, Any> {
                    completion(Device.Credentials(json: json) ?? RDError(json: json))
                } else {
                    completion(RDError(code: ErrorCode.JsonReadError))
                }
            }
        }
    }
}
