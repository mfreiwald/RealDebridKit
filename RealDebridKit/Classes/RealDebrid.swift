//
//  RealDebridKit.swift
//  Pods
//
//  Created by Michael Freiwald on 20.11.16.
//
//

import Foundation
import Alamofire

public let API_URL = "https://api.real-debrid.com/rest"
public let API_VERSION = "/1.0"
public let API_TOKEN = "QCUCM5XHIQV3KX6RDFYML4DJMM"

public var API:String {
    return API_URL + API_VERSION
}

public class RealDebrid {
    
    public class func getUser(completion: @escaping(_ user:User?)->Void) {
        Alamofire.request(API+"/user"+"?auth_token="+API_TOKEN).responseJSON { response in

            if let json = response.result.value as? Dictionary<String, Any> {
                let user = User(json: json)
                
                completion(user)
            }
        }
    }
    
    public class func unrestrictCheck(link:String, password:String, completion: @escaping(_ check:Unrestrict.Check?)->Void) {
        
        let parameters: Parameters = [
            "link": link,
            "password": password
        ]
        
        Alamofire.request(API+"/unrestrict/check"+"?auth_token="+API_TOKEN, method: .post, parameters: parameters).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, Any> {
                let check = Unrestrict.Check(json: json)
                
                completion(check)
            }
        }
        
    }
    
    public class func unrestrictLink(link:String, password:String, completion: @escaping(_ link:Unrestrict.Link?)->Void) {
        
        let parameters: Parameters = [
            "link": link,
            "password": password,
            "remote": 0
        ]
        
        Alamofire.request(API+"/unrestrict/link"+"?auth_token="+API_TOKEN, method: .post, parameters: parameters).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, Any> {
                let link = Unrestrict.Link(json: json)
                
                completion(link)
            }
        }
        
    }
}
