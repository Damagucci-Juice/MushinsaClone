//
//  ItemPageRepostory.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/09.
//

import Foundation

protocol ItemPageRepository {
    @discardableResult
    func fetchItemPage(cached: @escaping (ItemPage) -> Void,
                       completion: @escaping (Result<ItemPage, Error>) -> Void) -> Cancellable?
}
