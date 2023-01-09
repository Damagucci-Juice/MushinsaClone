//
//  ItemsResponseDTO+Mapping.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/09.
//

import Foundation

struct ItemsResponseDTO: Decodable {
    let data: [DatumDTO]
}

extension ItemsResponseDTO {
    func toDomain() -> ItemPage {
        return ItemPage(data: data.map { $0.toDomain() })
    }
}
