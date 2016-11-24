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
    let error:String
    let errorCode:ErrorCode
    public init?(json: JSON) {
        guard let error: String = "error" <~~ json else {
            return nil
        }
        self.error = error

        guard let errorCode: Int = "errorCode" <~~ json else {
            return nil
        }
        guard let errorCodeEnum = ErrorCode(rawValue: errorCode) else {
            return nil
        }
        self.errorCode = errorCodeEnum
    }
}
