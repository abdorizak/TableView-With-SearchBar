//
//  Article.swift
//  Table View
//
//  Created by Abdirizak Hassan on 10/2/21.
//

import Foundation

struct Article: Decodable {
    let headline: String
//    let subline: String
    let urlToImage: String?
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case headline = "title", urlToImage, url
    }
}




