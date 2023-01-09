//
//  ShowItemPageUseCase.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/09.
//

import Foundation

protocol FetchItemPageUseCase {
    func excute(cached: @escaping (ItemPage) -> Void,
                completion: @escaping (Result<ItemPage, Error>) -> Void) -> Cancellable?
}

final class DefaultFetchItemPageUseCase: FetchItemPageUseCase {
    
    typealias ResultValue = (Result<ItemPage, Error>)
    private let itemPageRepository: ItemPageRepository
    
    init(itemPageRepository: ItemPageRepository) {
        self.itemPageRepository = itemPageRepository
    }
    
    func excute(cached: @escaping (ItemPage) -> Void,
                completion: @escaping (Result<ItemPage, Error>) -> Void) -> Cancellable? {
        return itemPageRepository.fetchItemPage(cached: cached) { result in
            completion(result)
        }
    }
}
