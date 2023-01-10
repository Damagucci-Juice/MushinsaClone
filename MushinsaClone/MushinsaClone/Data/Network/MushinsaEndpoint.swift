//
//  MushinsaEndpoint.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/10.
//

import Foundation

enum MushinsaEndpoint {
    case main
    case photo(url: String)
}

extension MushinsaEndpoint :Resource {
    
    var baseURL: URL {
        switch self {
        case .main:
            return URL(string: "https://meta.musinsa.com/interview")!
        case .photo(url: let url):
            return URL(string: url)!
        }
    }
    
    var endpoint: Endpoint {
        switch self {
        case .main:
            return .get(path: "/list.json")
        case .photo:
            return .get(path: "")
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
