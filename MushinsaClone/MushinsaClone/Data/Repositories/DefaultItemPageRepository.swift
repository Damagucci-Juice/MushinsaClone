//
//  DefaultItemPageRepository.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/10.
//

import Foundation

final class DefaultItemPageRepository {
    
}

extension DefaultItemPageRepository: ItemPageRepository {
    
    func fetchItemPage(cached: @escaping (ItemPage) -> Void,
                       completion: @escaping (Result<ItemsResponseDTO, Error>) -> Void) -> Cancellable? {
        let networking = Networking<MushinsaEndpoint>()
        networking.request(resource: .main) { result in
            switch result {
            case let .success(response):
                if let itemsResponseDTO = try? response.map(to: ItemsResponseDTO.self) {
                    completion(.success(itemsResponseDTO))
                }
            case let .failure(.noData(response)):
                debugPrint(response)
            case .failure(.statusCode(_)):
                debugPrint("Statuse code out")
            case .failure(.decoding(_, _)):
                debugPrint("decoding Error")
            case .failure(.underlying(_, _)):
                debugPrint("underlying Error")
            }
        }
        return nil
    }
}
