//
//  MenuList.swift
//  CapstoneLittleLemonProject
//
//  Created by Valerie Gorbik on 9/4/23.
//

import Foundation

struct MenuList: Decodable {
    let menu:[MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
