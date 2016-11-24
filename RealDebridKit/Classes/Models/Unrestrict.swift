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
    
    public struct Link : Decodable {
        
        public struct Alternative : Decodable {
            public let id:String
            public let filename:String
            public let download:String
            public let quality:String
            
            public init?(json: JSON) {
                guard let id: String = "id" <~~ json else {
                    return nil
                }
                self.id = id
                
                guard let filename: String = "filename" <~~ json else {
                    return nil
                }
                self.filename = filename
                
                guard let download: String = "download" <~~ json else {
                    return nil
                }
                self.download = download
                
                guard let quality: String = "quality" <~~ json else {
                    return nil
                }
                self.quality = quality
            }
        }
        
        public let id:String
        public let filename:String
        public let mimeType:String?
        public let filesize:Int
        public let link:String
        public let host:String
        public let chunks:Int
        public let crc:Int
        public let download:String
        public let streamable:Int
        public let quality:String?
        public let alternative:[Alternative]?
        
        public init?(json: JSON) {
            guard let id: String = "id" <~~ json else {
                return nil
            }
            self.id = id
            
            guard let filename: String = "filename" <~~ json else {
                return nil
            }
            self.filename = filename
            
            self.mimeType = "mimeType" <~~ json
            
            guard let filesize: Int = "filesize" <~~ json else {
                return nil
            }
            self.filesize = filesize
            
            guard let link: String = "link" <~~ json else {
                return nil
            }
            self.link = link
            
            guard let host: String = "host" <~~ json else {
                return nil
            }
            self.host = host
            
            guard let chunks: Int = "chunks" <~~ json else {
                return nil
            }
            self.chunks = chunks
            
            guard let crc: Int = "crc" <~~ json else {
                return nil
            }
            self.crc = crc
            
            guard let download: String = "download" <~~ json else {
                return nil
            }
            self.download = download
            
            guard let streamable: Int = "streamable" <~~ json else {
                return nil
            }
            self.streamable = streamable
            
            self.quality = "quality" <~~ json
            self.alternative = "alternative" <~~ json
            
        }
    }
    
}
