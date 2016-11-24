//
//  Error.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation
import Gloss

public struct Error : Decodable {
    public let error:String
    public let errorCode:ErrorCode
    
    public init(json: JSON) {
        if let error: String = "error" <~~ json {
            self.error = error
        } else {
            self.error = "Unknown Error"
        }

        if let errorCode: Int = "error_code" <~~ json {
            if let errorCodeEnum = ErrorCode(rawValue: errorCode) {
                self.errorCode = errorCodeEnum
            } else {
                self.errorCode = ErrorCode.UnknownError
            }
        } else {
            self.errorCode = ErrorCode.UnknownError
        }
    }
}
