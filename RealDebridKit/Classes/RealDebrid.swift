//
//  RealDebridKit.swift
//  Pods
//
//  Created by Michael Freiwald on 20.11.16.
//
//

import Foundation
import Alamofire
import Gloss


public enum RequestError:String{
    case API_TOKEN = "Missing API Token"
}



public class RealDebridConfiguration {
    private static let RealDebridKit_CLIENT_ID:String = "S5TZKZVSGHVIY"
    
    var clientId:String?
    var clientSecret:String?
    
    private init() {
        
    }
    
    private init(clientId:String, clientSecret:String) {
        
    }
    
    private init(clientId:String) {
        
    }
    
    /**
     Create a configuration object for
     @param clientId 
     @param clientSecret
    */
    public class func with(clientId:String, clientSecret:String) -> RealDebridConfiguration {
        return RealDebridConfiguration()
    }
    
    public class func with(clientId:String) -> RealDebridConfiguration {
        return RealDebridConfiguration()
    }
}

public class RealDebrid {
    public static let API_URL = "https://api.real-debrid.com/rest"
    public static let API_VERSION = "/1.0"
    public static let API_CLIENT_ID = "S5TZKZVSGHVIY"
    
    enum APIMethod : String {
        case Token = "/token"
        case User = "/user"
        case UnrestrictCheck = "/unrestrict/check"
        case UnrestrictLink = "/unrestrict/link"
        case UnrestrictFolder = "/unrestrict/folder"
        case UnrestrictContainerFile = "/unrestrict/containerFile"
        case UnrestrictContainerLink = "/unrestrict/containerLink"
    }
    
    
    
    //public let API_TOKEN = "QCUCM5XHIQV3KX6RDFYML4DJMM"
    private static var API_TOKEN = ""
    
    public static var API:String {
        return API_URL + API_VERSION
    }
    
    public class func provideAPIToken(token:String) {
        API_TOKEN = token
    }
    
    private class func getFullApiUrl(method:APIMethod) -> String {
        return API + method.rawValue + "?auth_token=" + API_TOKEN
    }
    
    private class func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer " + API_TOKEN,
            "Accept": "application/json"
        ]
        return headers
    }


    private class func request(apiMethod: APIMethod, httpMethod: HTTPMethod, parameters: Parameters) -> DataRequest {
        // TODO: throw if api token is missing
        // maybe request token
        return Alamofire.request(getFullApiUrl(method: apiMethod), method: httpMethod, parameters: parameters, headers: getHeaders())
    }
    
    private class func request(apiMethod: APIMethod, httpMethod: HTTPMethod) -> DataRequest {
        return request(apiMethod: apiMethod, httpMethod: httpMethod, parameters: Parameters())
    }
    
 
    
    
    public class func getUser(completion: @escaping(_ user:User?)->Void) {
        request(apiMethod: .User, httpMethod: .get).responseJSON { (response) in
            if let json = response.result.value as? Dictionary<String, Any> {
                let user = User(json: json)
                completion(user)
            } else {
                completion(nil)
            }
        }
    }
    
    public class func unrestrictCheck(link:String, password:String, completion: @escaping(_ check:Unrestrict.Check?)->Void) {
        
        let parameters: Parameters = [
            "link": link,
            "password": password
        ]
        
        request(apiMethod: .UnrestrictCheck, httpMethod: .post, parameters: parameters).responseJSON { (response) in
            if let json = response.result.value as? Dictionary<String, Any> {
                let check = Unrestrict.Check(json: json)
                completion(check)
            } else {
                completion(nil)
            }
        }
        
    }
    
    public class func unrestrictLink(link:String, password:String, remote:Int, completion: @escaping(_ link:Unrestrict.Link?)->Void) {
        
        let parameters: Parameters = [
            "link": link,
            "password": password,
            "remote": remote
        ]
        
        request(apiMethod: .UnrestrictLink, httpMethod: .post, parameters: parameters).responseJSON { (response) in
            if let json = response.result.value as? Dictionary<String, Any> {
                let link = Unrestrict.Link(json: json)
                completion(link)
            } else {
                completion(nil)
            }
        }
    }
    
    public class func unrestrictLink(link:String, completion: @escaping(_ link:Unrestrict.Link?)->Void) {
        unrestrictLink(link: link, password: "", remote: 0, completion: completion)
    }
    
    public class func unrestrictLink(link:String, password:String, completion: @escaping(_ link:Unrestrict.Link?)->Void) {
        unrestrictLink(link: link, password: password, remote: 0, completion: completion)
    }
    
    public class func unrestrictLink(link:String, remote:Int, completion: @escaping(_ link:Unrestrict.Link?)->Void) {
        unrestrictLink(link: link, password: "", remote: remote, completion: completion)
    }
    
    public class func unrestrictFolder(link:String, completion: @escaping(_ urls:[String]?)->Void) {
        
        let parameters: Parameters = [
            "link": link
        ]
        
        request(apiMethod: .UnrestrictFolder, httpMethod: .post, parameters: parameters).responseJSON { (response) in
            if let json = response.result.value as? [String] {
                completion(json)
            } else {
                completion(nil)
            }
        }
    }
    
    public class func unrestrictContainerLink(link:String, completion: @escaping(_ urls:[String]?)->Void) {
        
        let parameters: Parameters = [
            "link": link
        ]
        
        request(apiMethod: .UnrestrictContainerLink, httpMethod: .post, parameters: parameters).responseJSON { (response) in
            if let json = response.result.value as? [String] {
                completion(json)
            } else {
                completion(nil)
            }
        }
    }
    
    public class func unrestrictContainerFile(fileURL:URL, completion: @escaping(_ urls:[String]?)->Void) {
        Alamofire.upload(fileURL, to: API+"/unrestrict/containerFile"+"?auth_token="+API_TOKEN, method: .put, headers: nil).responseJSON { response in
            if let json = response.result.value as? [String] {
                completion(json)
            } else {
                completion(nil)
            }
        }
    }
}
