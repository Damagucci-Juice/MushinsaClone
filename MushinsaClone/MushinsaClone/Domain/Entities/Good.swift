//
//  Good.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/09.
//

import Foundation

struct Good: Equatable {
    let linkURL: String
    let thumbnailURL: String
    let brandName: String
    let price, saleRate: Int
    let hasCoupon: Bool
}
