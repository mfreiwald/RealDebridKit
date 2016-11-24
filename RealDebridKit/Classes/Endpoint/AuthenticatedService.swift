//
//  AuthenticatedService.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation

public class AuthenticatedService : BaseService {
    
    public init(authToken:String) {
        super.init()
        self.headers["Authorization"] = "Bearer " + authToken
        self.headers["Accept"] = "application/json"
    }
}
