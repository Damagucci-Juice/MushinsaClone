//
//  URL+Extension.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/10.
//

import Foundation

internal extension URL {
    func appendingQueryParameters(_ parameters: [String: Any], encoding: URLEncoding) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        urlComponents.query = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "") + encoding.query(parameters)

        return urlComponents.url!
    }

}
