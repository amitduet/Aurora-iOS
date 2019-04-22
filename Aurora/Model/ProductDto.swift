//
//  ProductDto.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/18/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//


// To parse the JSON, add this file to your project and do:
//
//   let productDto = try? newJSONDecoder().decode(ProductDto.self, from: jsonData)

// To parse the JSON, add this file to your project and do:
//
//   let productDto = try? newJSONDecoder().decode(ProductDto.self, from: jsonData)

import Foundation

class ProductDto: Codable {
    let productByCategory: [ProductByCategory]
    
    init(productByCategory: [ProductByCategory]) {
        self.productByCategory = productByCategory
    }
}

class ProductByCategory: Codable {
    let categoryID, parentID: Int
    let categoryName: String
    let productID: Int
    let image, name, metaTitle, metaDescription: String
    let metaKeyword, tag, model, sku: String
    let location: String
    let quantity: Int
    let price: String
    let specialPrice: String?
    let discountPrice: JSONNull?
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case parentID = "parent_id"
        case categoryName
        case productID = "product_id"
        case image, name
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case metaKeyword = "meta_keyword"
        case tag, model, sku, location, quantity, price, specialPrice, discountPrice, description
    }
    
    init(categoryID: Int, parentID: Int, categoryName: String, productID: Int, image: String, name: String, metaTitle: String, metaDescription: String, metaKeyword: String, tag: String, model: String, sku: String, location: String, quantity: Int, price: String, specialPrice: String?, discountPrice: JSONNull?, description: String) {
        self.categoryID = categoryID
        self.parentID = parentID
        self.categoryName = categoryName
        self.productID = productID
        self.image = image
        self.name = name
        self.metaTitle = metaTitle
        self.metaDescription = metaDescription
        self.metaKeyword = metaKeyword
        self.tag = tag
        self.model = model
        self.sku = sku
        self.location = location
        self.quantity = quantity
        self.price = price
        self.specialPrice = specialPrice
        self.discountPrice = discountPrice
        self.description = description
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
