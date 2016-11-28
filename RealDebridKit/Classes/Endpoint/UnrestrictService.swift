//
//  UnrestrictService.swift
//  Pods
//
//  Created by Michael Freiwald on 26.11.16.
//
//

import Foundation
import Alamofire

public class UnrestrictService {
    
    public class Check : BaseService {
        
        override var url: String {
            return RealDebrid.REST_URL+"/unrestrict/check"
        }
        
        public init(link: String, password: String = "") {
            super.init()
            self.parameters["link"] = link
            self.parameters["password"] = password
        }
        
        public override func perform(completion: @escaping (Any?) -> Void) {
            createRequest(method: .post).responseJSON { (response) in
                print(response)
                if let json = response.result.value as? Dictionary<String, Any> {
                    completion(Unrestrict.Check(json: json) ?? RDError(json: json))
                } else {
                    completion(RDError(code: ErrorCode.JsonReadError))
                }
            }
        }

    }
    
    public class Link : AuthenticatedService {
    
        override var url: String {
            return RealDebrid.REST_URL+"/unrestrict/link"
        }
        
        public init(authToken: String, link: String, password: String = "", remote: Int = 0) {
            super.init(authToken: authToken)
            self.parameters["link"] = link
            self.parameters["password"] = password
            self.parameters["remote"] = remote
        }
        
        public override func perform(completion: @escaping (Any?) -> Void) {
            createRequest(method: .post).responseJSON { (response) in
                if let json = response.result.value as? Dictionary<String, Any> {
                    completion(Unrestrict.Link(json: json) ?? RDError(json: json))
                } else {
                    completion(RDError(code: ErrorCode.JsonReadError))
                }
            }
        }
        
    }
    
    public class Folder : AuthenticatedService {
        override var url: String {
            return RealDebrid.REST_URL+"/unrestrict/folder"
        }
        
        public init(authToken: String, link: String) {
            super.init(authToken: authToken)
            self.parameters["link"] = link
        }
        
        public override func perform(completion: @escaping (Any?) -> Void) {
            createRequest(method: .post).responseJSON { (response) in
                if let json = response.result.value as? Array<String> {
                    completion(json)
                } else if let json = response.result.value as? Dictionary<String, Any> {
                    completion(RDError(json: json))
                } else {
                    completion(RDError(code: ErrorCode.JsonReadError))
                }
            }
        }
    }
    
    public class ContainerLink : AuthenticatedService {
        override var url: String {
            return RealDebrid.REST_URL+"/unrestrict/containerLink"
        }
        
        public init(authToken: String, link: String) {
            super.init(authToken: authToken)
            self.parameters["link"] = link
        }
        
        public override func perform(completion: @escaping (Any?) -> Void) {
            createRequest(method: .post).responseJSON { (response) in
                if let json = response.result.value as? Array<String> {
                    completion(json)
                } else if let json = response.result.value as? Dictionary<String, Any> {
                    completion(RDError(json: json))
                } else {
                    completion(RDError(code: ErrorCode.JsonReadError))
                }
            }
        }
    }
    
    public class ContainerFile : AuthenticatedService {
        override var url: String {
            return RealDebrid.REST_URL+"/unrestrict/containerFile"
        }
        private let fileURL:URL
        
        public init(authToken: String, fileURL:URL) {
            self.fileURL = fileURL
            super.init(authToken: authToken)
        }
        
        public override func perform(completion: @escaping (Any?) -> Void) {
            Alamofire.upload(self.fileURL, to: self.url, method: .put, headers: self.headers).responseJSON { response in
                if let json = response.result.value as? Array<String> {
                    completion(json)
                } else if let json = response.result.value as? Dictionary<String, Any> {
                    completion(RDError(json: json))
                } else {
                    completion(RDError(code: ErrorCode.JsonReadError))
                }
            }
        }
    }
}
