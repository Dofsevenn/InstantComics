//
//  ComicResponse.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 16/03/2021.
//
// This file was generated from JSON Schema using quicktype
//   let comicsResponse = try? newJSONDecoder().decode(ComicsResponse.self, from: jsonData)

import Foundation

// The top level comics response struct
struct ComicsResponse: Codable, Equatable{
    let month: String
    let num: Int
    let link, year, news, safeTitle: String
    let transcript: String?
    let alt: String
    let img: String
    let title, day: String

    enum CodingKeys: String, CodingKey {
        case month, num, link, year, news
        case safeTitle = "safe_title"
        case transcript, alt, img, title, day
    }
}

