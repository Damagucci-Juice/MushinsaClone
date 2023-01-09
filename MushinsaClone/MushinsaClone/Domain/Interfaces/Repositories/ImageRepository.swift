//
//  ImageRepository.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/09.
//

import Foundation

protocol ImageRepository {
    func fetchImage(with imagePath: String,
                    width: Int,
                    completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable?
}
