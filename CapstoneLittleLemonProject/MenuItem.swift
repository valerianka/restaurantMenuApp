//
//  MenuItem.swift
//  CapstoneLittleLemonProject
//
//  Created by Valerie Gorbik on 9/4/23.
//

import Foundation

struct MenuItem: Codable {
    let id: Int
    let title: String
    let price: String
    let itemDescription: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case itemDescription = "description"
        case image = "image"
        case category = "category"
    }
}
