//
//  MainCategoryDto.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/7/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let mainCategoryDto = try? newJSONDecoder().decode(MainCategoryDto.self, from: jsonData)

import Foundation

class MainCategoryDto: Codable {
    let mainCategories: [MainCategory]
    
    init(mainCategories: [MainCategory]) {
        self.mainCategories = mainCategories
    }
}

class MainCategory: Codable {
    let categoryID: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case name
    }
    
    init(categoryID: Int, name: String) {
        self.categoryID = categoryID
        self.name = name
    }
}
