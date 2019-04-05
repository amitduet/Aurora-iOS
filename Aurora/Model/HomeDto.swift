//
//  HomeDto.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/4/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let homeDto = try? newJSONDecoder().decode(HomeDto.self, from: jsonData)

import Foundation

struct HomeDto: Codable {
    let status: String
    let sliders: [DiscountBanner]
    let discountProducts: [DiscountProduct]
    let newlyArrived: [NewlyArrived]
    let discountBanner: [DiscountBanner]
    
    enum CodingKeys: String, CodingKey {
        case status, sliders
        case discountProducts = "discount_products"
        case newlyArrived = "newly_arrived"
        case discountBanner
    }
}

struct DiscountBanner: Codable {
    let bannerImageID, bannerID, languageID: Int
    let title, link, image: String
    let sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case bannerImageID = "banner_image_id"
        case bannerID = "banner_id"
        case languageID = "language_id"
        case title, link, image
        case sortOrder = "sort_order"
    }
}

struct DiscountProduct: Codable {
    let productSpecialID, productID: Int
    let name, model, price, oldPrice: String
    let priority, customerGroupID: Int
    let dateStart, dateEnd: String
    
    enum CodingKeys: String, CodingKey {
        case productSpecialID = "product_special_id"
        case productID = "product_id"
        case name, model, price, oldPrice, priority
        case customerGroupID = "customer_group_id"
        case dateStart = "date_start"
        case dateEnd = "date_end"
    }
}

struct NewlyArrived: Codable {
    let productID: Int
    let name, model: String
    let sku: Sku
    let price: String
    let quantity: Int
    let image: String
    let manufacturerID: Int
    let manufacturerName: String
    let shipping, points: Int
    let dateAvailable, weight, length, width: String
    let height, description: String
    let stockStatus: StockStatus
    let tag: Tag
    let metaTitle: String
    let metaDescription: MetaDescription
    let metaKeyword: MetaKeyword
    let dateAdded, dateModified: String
    
    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, model, sku, price, quantity, image
        case manufacturerID = "manufacturer_id"
        case manufacturerName, shipping, points
        case dateAvailable = "date_available"
        case weight, length, width, height, description, stockStatus, tag
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case metaKeyword = "meta_keyword"
        case dateAdded = "date_added"
        case dateModified = "date_modified"
    }
}

enum MetaDescription: String, Codable {
    case empty = ""
    case jeansPantForMen = "Jeans Pant for men"
}

enum MetaKeyword: String, Codable {
    case empty = ""
    case jeansPant = "Jeans Pant "
}

enum Sku: String, Codable {
    case empty = ""
    case sku00 = "sku-00"
    case test1 = "test 1"
}

enum StockStatus: String, Codable {
    case inStock = "In Stock"
    case outOfStock = "Out Of Stock"
    case the23Days = "2-3 Days"
}

enum Tag: String, Codable {
    case empty = ""
    case jeansMenPant = "jeans, men, pant,"
}
