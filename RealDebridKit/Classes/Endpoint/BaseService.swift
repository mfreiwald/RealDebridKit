//
//  BaseService.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation
import Alamofire

public class BaseService {
    
    internal var headers:HTTPHeaders
    internal var parameters:Parameters
    internal var url:String { return "" }
    
    internal init() {
        self.headers = HTTPHeaders()
        self.parameters = Parameters()
    }
    
    public func perform(completion: @escaping(Any?)->Void) {
        completion(nil)
    }
    
    internal func createRequest(method:HTTPMethod = .get) -> DataRequest {
        let request:DataRequest = Alamofire.request(url, method: method, parameters: self.parameters, headers: self.headers)
        return request
    }
    
}
