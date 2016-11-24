//
//  DeviceService.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation

class DeviceService : BaseService {
    
    class CodeService : BaseService {
        
        init(clientId:String) {
            super.init()
            self.parameters = [
                "client_id" : clientId
            ]
        }
        
        convenience init(clientId:String, newCredentials:Bool) {
            if(newCredentials) {
                self.init(clientId: clientId)
                self.parameters["new_credentials"] = "yes"
            } else {
                self.init(clientId: clientId)
            }
        }
    }
    
    class CredentialsService : BaseService {
        
        init(clientId:String, code:String) {
            super.init()
            self.parameters["client_id"] = clientId
            self.parameters["code"] = code
        }
    }
}
