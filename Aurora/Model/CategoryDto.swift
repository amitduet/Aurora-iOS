//
//  CategoryDto.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/16/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let categoryDto = try? newJSONDecoder().decode(CategoryDto.self, from: jsonData)

import Foundation

class CategoryDto: Codable {
    let category: [Category]
    
    init(category: [Category]) {
        self.category = category
    }
}

class Category: Codable {
    let categoryID: Int
    let image: String
    let parentID, top, column, sortOrder: Int
    let status: Int
    let dateAdded, dateModified: String
    let languageID: Int
    let name, description, metaTitle, metaDescription: String
    let metaKeyword: String
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case image
        case parentID = "parent_id"
        case top, column
        case sortOrder = "sort_order"
        case status
        case dateAdded = "date_added"
        case dateModified = "date_modified"
        case languageID = "language_id"
        case name, description
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case metaKeyword = "meta_keyword"
    }
    
    init(categoryID: Int, image: String, parentID: Int, top: Int, column: Int, sortOrder: Int, status: Int, dateAdded: String, dateModified: String, languageID: Int, name: String, description: String, metaTitle: String, metaDescription: String, metaKeyword: String) {
        self.categoryID = categoryID
        self.image = image
        self.parentID = parentID
        self.top = top
        self.column = column
        self.sortOrder = sortOrder
        self.status = status
        self.dateAdded = dateAdded
        self.dateModified = dateModified
        self.languageID = languageID
        self.name = name
        self.description = description
        self.metaTitle = metaTitle
        self.metaDescription = metaDescription
        self.metaKeyword = metaKeyword
    }
}
