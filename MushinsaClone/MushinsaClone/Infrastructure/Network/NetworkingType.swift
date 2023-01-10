//
//  NetworkingType.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/10.
//

import Foundation

public protocol NetworkingType {

    associatedtype Resource

    func request(
        resource: Resource,
        session: NetworkingSession,
        queue: DispatchQueue,
        completion: @escaping (Result<Response, TinyNetworkingError>) -> Void
        ) -> URLSessionDataTask
}

