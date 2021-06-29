//
//  ErrorProtocol.swift
//  NYT
//
//  Created by emir kartal on 26.06.2021.
//

import Foundation
import Moya

public enum APIError: Error {
    case generalError
    case parseError
    case apiError(String)
    case connectionError
}

extension APIError: Equatable {
    
    public var localizedDescription: String {
        return getMessage()
    }
    
    private func getMessage()-> String {
        switch self {
        case .generalError, .parseError:
            return "Something went wrong!"
        case .connectionError:
            return "Check your internet connection!"
        case .apiError(let message):
            return message
        }
    }
}

protocol ErrorProtocol{}

extension ErrorProtocol {
    // This func changes type of Moya error to Our custom APIError
    func getResponseError(from error: MoyaError)-> APIError {
        if let data = error.response?.data {
            do{
                let apiError = try Decoders.mainDecoder.decode(ErrorModel.self, from: data)
                return .apiError(apiError.fault?.faultstring ?? "")
            }catch {
                return .generalError
            }

        }else {
            let value = error.errorUserInfo["NSUnderlyingError"] as! APIError
            if value == .connectionError {
                return .connectionError
            }else {
                return .generalError
            }
        }
    }
}
