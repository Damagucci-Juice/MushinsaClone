//
//  ContentsDTO+Mapping.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/09.
//

import Foundation

struct ContentsDTO: Decodable {
    let type: String
    let banners: [BannerDTO]?
    let goods: [GoodDTO]?
    let styles: [StyleDTO]?
    
    struct BannerDTO: Decodable {
        let linkURL: String
        let thumbnailURL: String
        let title, description, keyword: String
    }

    struct GoodDTO: Decodable {
        let linkURL: String
        let thumbnailURL: String
        let brandName: BrandNameDTO
        let price, saleRate: Int
        let hasCoupon: Bool
        
        enum BrandNameDTO: String, Decodable {
            case 디스커버리익스페디션 = "디스커버리 익스페디션"
            case 아스트랄프로젝션 = "아스트랄 프로젝션"
            case 텐블레이드 = "텐블레이드"
            
            var text: String {
                self.rawValue
            }
        }
    }

    struct StyleDTO: Decodable {
        let linkURL: String
        let thumbnailURL: String
    }
}

extension ContentsDTO {
    func toDomain() -> Contents {
        return Contents(type: type,
                        banners: banners?.compactMap { $0.toDomain() },
                        goods: goods?.compactMap { $0.toDomain() },
                        styles: styles?.compactMap { $0.toDomain() })
    }
}

extension ContentsDTO.BannerDTO {
    func toDomain() -> Banner {
        return Banner(linkURL: linkURL,
                      thumbnailURL: thumbnailURL,
                      title: title, description: description,
                      keyword: keyword)
    }
}

extension ContentsDTO.GoodDTO {
    func toDomain() -> Good {
        return Good(linkURL: linkURL,
                    thumbnailURL: thumbnailURL,
                    brandName: brandName.text,
                    price: price,
                    saleRate: saleRate,
                    hasCoupon: hasCoupon)
    }
}

extension ContentsDTO.StyleDTO {
    func toDomain() -> Style {
        return Style(linkURL: linkURL,
                     thumbnailURL: thumbnailURL)
    }
}
