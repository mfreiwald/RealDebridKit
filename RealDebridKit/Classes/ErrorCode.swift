//
//  ErrorCode.swift
//  Pods
//
//  Created by Michael Freiwald on 24.11.16.
//
//

import Foundation

public enum ErrorCode : Int {
    case UnknownError = -500
    case InternalError = -1
    case MissingParameter = 1
    case BadParameterValue = 2
    case UnknownMethod = 3
    case MethodNotAllowed = 4
    case SlowDown = 5
    case RessourceUnreachable = 6
    case ResourceNotFound = 7
    case BadToken = 8
    case PermissionDenied = 9
    case TwoFactorAuthenticationNeeded = 10
    case TwoFactorAuthenticationPending = 11
    case InvalidLogin = 12
    case InvalidPassword = 13
    case AccountLocked = 14
    case AccountNotActivated = 15
    case UnsupportedHoster = 16
    case HosterInMaintenance = 17
    case HosterLimitReached = 18
    case HosterTemporarilyUnavailable = 19
    case HosterNotAvailableForFreeUsers = 20
    case TooManyActiveDownloads = 21
    case IpAddressNotAllowed = 22
    case TrafficExhausted = 23
    case FileUnavailable = 24
    case ServiceUnavailable = 25
    case UploadTooBig = 26
    case UploadError = 27
    case FileNotAllowed = 28
    case TorrentTooBig = 29
    case TorrentFileInvalid = 30
    case ActionAlreadyDone = 31
    case ImageResolutionError = 32
}
