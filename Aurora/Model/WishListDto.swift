//
//  WishListDto.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/24/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wishListDto = try? newJSONDecoder().decode(WishListDto.self, from: jsonData)

import Foundation

// MARK: - WishListDto
class WishListDto: Codable {
    let wishList: [WishProduct]
    
    init(wishList: [WishProduct]) {
        self.wishList = wishList
    }
}

// MARK: - WishList
class WishProduct: Codable {
    let productID: Int
    let model, sku, upc, ean: String
    let jan, isbn, mpn, location: String
    let quantity, stockStatusID: Int
    let image: String
    let manufacturerID, shipping: Int
    let price: String
    let points, taxClassID: Int
    let dateAvailable, weight: String
    let weightClassID: Int
    let length, width, height: String
    let lengthClassID, subtract, minimum, sortOrder: Int
    let status, viewed: Int
    let dateAdded, dateModified: String
    let languageID: Int
    let name, wishListDescription, tag, metaTitle: String
    let metaDescription, metaKeyword: String
    let customerID: Int
    let discountPrice: String?
    
    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case model, sku, upc, ean, jan, isbn, mpn, location, quantity
        case stockStatusID = "stock_status_id"
        case image
        case manufacturerID = "manufacturer_id"
        case shipping, price, points
        case taxClassID = "tax_class_id"
        case dateAvailable = "date_available"
        case weight
        case weightClassID = "weight_class_id"
        case length, width, height
        case lengthClassID = "length_class_id"
        case subtract, minimum
        case sortOrder = "sort_order"
        case status, viewed
        case dateAdded = "date_added"
        case dateModified = "date_modified"
        case languageID = "language_id"
        case name
        case wishListDescription = "description"
        case tag
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case metaKeyword = "meta_keyword"
        case customerID = "customer_id"
        case discountPrice
    }
    
    init(productID: Int, model: String, sku: String, upc: String, ean: String, jan: String, isbn: String, mpn: String, location: String, quantity: Int, stockStatusID: Int, image: String, manufacturerID: Int, shipping: Int, price: String, points: Int, taxClassID: Int, dateAvailable: String, weight: String, weightClassID: Int, length: String, width: String, height: String, lengthClassID: Int, subtract: Int, minimum: Int, sortOrder: Int, status: Int, viewed: Int, dateAdded: String, dateModified: String, languageID: Int, name: String, wishListDescription: String, tag: String, metaTitle: String, metaDescription: String, metaKeyword: String, customerID: Int, discountPrice: String?) {
        self.productID = productID
        self.model = model
        self.sku = sku
        self.upc = upc
        self.ean = ean
        self.jan = jan
        self.isbn = isbn
        self.mpn = mpn
        self.location = location
        self.quantity = quantity
        self.stockStatusID = stockStatusID
        self.image = image
        self.manufacturerID = manufacturerID
        self.shipping = shipping
        self.price = price
        self.points = points
        self.taxClassID = taxClassID
        self.dateAvailable = dateAvailable
        self.weight = weight
        self.weightClassID = weightClassID
        self.length = length
        self.width = width
        self.height = height
        self.lengthClassID = lengthClassID
        self.subtract = subtract
        self.minimum = minimum
        self.sortOrder = sortOrder
        self.status = status
        self.viewed = viewed
        self.dateAdded = dateAdded
        self.dateModified = dateModified
        self.languageID = languageID
        self.name = name
        self.wishListDescription = wishListDescription
        self.tag = tag
        self.metaTitle = metaTitle
        self.metaDescription = metaDescription
        self.metaKeyword = metaKeyword
        self.customerID = customerID
        self.discountPrice = discountPrice
    }
}
