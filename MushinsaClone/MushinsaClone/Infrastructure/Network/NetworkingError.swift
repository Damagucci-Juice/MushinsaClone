//
//  NetworkingError.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/10.
//

import Foundation

public enum TinyNetworkingError: Swift.Error {
    case noData(Response)
    case statusCode(Response)
    case decoding(Swift.Error, Response)
    case underlying(Swift.Error, Response?)
}

public extension TinyNetworkingError {
    var response: Response? {
        switch self {
        case let .noData(response):
            return response
        case let .statusCode(response):
            return response
        case let .decoding(_, response):
            return response
        case let .underlying(_, response):
            return response
        }
    }
}

extension TinyNetworkingError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noData:
            return "The request gave no data."
        case .statusCode:
            return "Status code didn't fall within the given range."
        case .decoding:
            return "Failed to map data to a Decodable object."
        case let .underlying(error, _):
            return error.localizedDescription
        }
    }
}
