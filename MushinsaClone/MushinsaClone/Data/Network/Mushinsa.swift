//
//  Mushinsa.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/10.
//

import Foundation

enum Mushinsa {
    case main
}

extension Mushinsa :Resource {
    var baseURL: URL {
        return URL(string: "https://meta.musinsa.com/interview")!
    }
    
    var endpoint: Endpoint {
        switch self {
        case .main:
            return .get(path: "/list.json")
        }
    }
    
    var task: Task {
        var params: [String: Any] = [:]
        return .requestWithParameters(params, encoding: URLEncoding())
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        return .useProtocolCachePolicy
    }
}
