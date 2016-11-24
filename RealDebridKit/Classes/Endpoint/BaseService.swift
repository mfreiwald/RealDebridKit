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
    
    var headers:HTTPHeaders
    var parameters:Parameters
    
    init() {
        self.headers = HTTPHeaders()
        self.parameters = Parameters()
    }
    
    public func perform(complete: @escaping(_ data:Any?, _ error:ErrorCode?)->Void) {
        complete(nil, ErrorCode.UnknownError)
    }
    
}
