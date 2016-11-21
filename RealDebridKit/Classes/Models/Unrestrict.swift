//
//  Unrestrict.swift
//  Pods
//
//  Created by Michael Freiwald on 21.11.16.
//
//

import Foundation
import Gloss

public struct Unrestrict {
    public struct Check : Decodable {
        
        public let host:String
        public let link:String
        public let filename:String
        public let filesize:Int
        public let supported:Int
        
        public init?(json: JSON) {
            guard let host: String = "host" <~~ json else {
                return nil
            }
            guard let link: String = "link" <~~ json else {
                return nil
            }
            guard let filename: String = "filename" <~~ json else {
                return nil
            }
            guard let filesize: Int = "filesize" <~~ json else {
                return nil
            }
            guard let supported: Int = "supported" <~~ json else {
                return nil
            }
            self.host = host
            self.link = link
            self.filename = filename
            self.filesize = filesize
            self.supported = supported
        }
    }
}
