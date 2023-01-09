//
//  DatumDTO+Mapping.swift
//  MushinsaClone
//
//  Created by YEONGJIN JANG on 2023/01/09.
//

import Foundation

struct DatumDTO: Decodable {
    let contents: ContentsDTO
    let header: HeaderDTO?
    let footer: FooterDTO?
}

extension DatumDTO {
    struct FooterDTO: Decodable {
        let type, title: String
        let iconURL: String?
    }

    // MARK: - Header
    struct HeaderDTO: Decodable {
        let title: String
        let iconURL: String?
        let linkURL: String?
    }
}

extension DatumDTO {
    func toDomain() -> Datum {
        return Datum(contents: contents.toDomain(),
                     header: header?.toDomain(),
                     footer: footer?.toDomain())
    }
}

extension DatumDTO.HeaderDTO {
    func toDomain() -> Header {
        return Header(title: title,
                      iconURL: iconURL,
                      linkURL: linkURL)
    }
}

extension DatumDTO.FooterDTO {
    func toDomain() -> Footer {
        return Footer(type: type,
                      title: title,
                      iconURL: iconURL)
    }
}
