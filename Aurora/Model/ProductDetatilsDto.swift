//
//  ProductDetatilsDto.swift
//  Aurora
//
//  Created by Amit Chowdhury on 4/23/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//


// To parse the JSON, add this file to your project and do:
//
//   let productDetatilsDto = try? newJSONDecoder().decode(ProductDetatilsDto.self, from: jsonData)
 
import Foundation

//class ProductDetatilsDto: Codable {
//    let productDetails: [ProductDetail]
//    let aditionalImages: [AditionalImage]
//    let options: [Option]
//    let relatedProducts: [RelatedProduct]
//    let rating: String
//    let review: [Review]
//
//    init(productDetails: [ProductDetail], aditionalImages: [AditionalImage], options: [Option], relatedProducts: [RelatedProduct], rating: String, review: [Review]) {
//        self.productDetails = productDetails
//        self.aditionalImages = aditionalImages
//        self.options = options
//        self.relatedProducts = relatedProducts
//        self.rating = rating
//        self.review = review
//    }
//}
//
//class AditionalImage: Codable {
//    let productImageID, productID: Int
//    let image: String
//    let sortOrder: Int
//
//    enum CodingKeys: String, CodingKey {
//        case productImageID = "product_image_id"
//        case productID = "product_id"
//        case image
//        case sortOrder = "sort_order"
//    }
//
//    init(productImageID: Int, productID: Int, image: String, sortOrder: Int) {
//        self.productImageID = productImageID
//        self.productID = productID
//        self.image = image
//        self.sortOrder = sortOrder
//    }
//}
//
//class Option: Codable {
//    let optionDescriptionName: OptionDescriptionName
//    let optionValueDescriptionName, optionValueImage: String
//    let productOptionValueID, productOptionID, productID, optionID: Int
//    let optionValueID, quantity, subtract: Int
//    let price: String
//    let pricePrefix: Prefix
//    let points: Int
//    let pointsPrefix: Prefix
//    let weight: String
//    let weightPrefix: Prefix
//
//    enum CodingKeys: String, CodingKey {
//        case optionDescriptionName = "option_description_name"
//        case optionValueDescriptionName = "option_value_description_name"
//        case optionValueImage = "option_value_image"
//        case productOptionValueID = "product_option_value_id"
//        case productOptionID = "product_option_id"
//        case productID = "product_id"
//        case optionID = "option_id"
//        case optionValueID = "option_value_id"
//        case quantity, subtract, price
//        case pricePrefix = "price_prefix"
//        case points
//        case pointsPrefix = "points_prefix"
//        case weight
//        case weightPrefix = "weight_prefix"
//    }
//
//    init(optionDescriptionName: OptionDescriptionName, optionValueDescriptionName: String, optionValueImage: String, productOptionValueID: Int, productOptionID: Int, productID: Int, optionID: Int, optionValueID: Int, quantity: Int, subtract: Int, price: String, pricePrefix: Prefix, points: Int, pointsPrefix: Prefix, weight: String, weightPrefix: Prefix) {
//        self.optionDescriptionName = optionDescriptionName
//        self.optionValueDescriptionName = optionValueDescriptionName
//        self.optionValueImage = optionValueImage
//        self.productOptionValueID = productOptionValueID
//        self.productOptionID = productOptionID
//        self.productID = productID
//        self.optionID = optionID
//        self.optionValueID = optionValueID
//        self.quantity = quantity
//        self.subtract = subtract
//        self.price = price
//        self.pricePrefix = pricePrefix
//        self.points = points
//        self.pointsPrefix = pointsPrefix
//        self.weight = weight
//        self.weightPrefix = weightPrefix
//    }
//}
//
//enum OptionDescriptionName: String, Codable {
//    case color = "Color"
//    case size = "Size"
//}
//
//enum Prefix: String, Codable {
//    case empty = "+"
//}
//
//class ProductDetail: Codable {
//    let productID: Int
//    let model, sku, upc, ean: String
//    let jan, isbn, mpn, location: String
//    let quantity, stockStatusID: Int
//    let image: String
//    let manufacturerID, shipping: Int
//    let price: String
//    let points, taxClassID: Int
//    let dateAvailable, weight: String
//    let weightClassID: Int
//    let length, width, height: String
//    let lengthClassID, subtract, minimum, sortOrder: Int
//    let status, viewed: Int
//    let dateAdded, dateModified: String
//    let languageID: Int
//    let name, description, tag, metaTitle: String
//    let metaDescription, metaKeyword : String
//    let discountPrice: Int
//
//
//    enum CodingKeys: String, CodingKey {
//        case productID = "product_id"
//        case model, sku, upc, ean, jan, isbn, mpn, location, quantity
//        case stockStatusID = "stock_status_id"
//        case image
//        case manufacturerID = "manufacturer_id"
//        case shipping, price, points
//        case taxClassID = "tax_class_id"
//        case dateAvailable = "date_available"
//        case weight
//        case weightClassID = "weight_class_id"
//        case length, width, height
//        case lengthClassID = "length_class_id"
//        case subtract, minimum
//        case sortOrder = "sort_order"
//        case status, viewed
//        case dateAdded = "date_added"
//        case dateModified = "date_modified"
//        case languageID = "language_id"
//        case name, description, tag
//        case metaTitle = "meta_title"
//        case metaDescription = "meta_description"
//        case metaKeyword = "meta_keyword"
//        case discountPrice
//    }
//
//    init(productID: Int, model: String, sku: String, upc: String, ean: String, jan: String, isbn: String, mpn: String, location: String, quantity: Int, stockStatusID: Int, image: String, manufacturerID: Int, shipping: Int, price: String, points: Int, taxClassID: Int, dateAvailable: String, weight: String, weightClassID: Int, length: String, width: String, height: String, lengthClassID: Int, subtract: Int, minimum: Int, sortOrder: Int, status: Int, viewed: Int, dateAdded: String, dateModified: String, languageID: Int, name: String, description: String, tag: String, metaTitle: String, metaDescription: String, metaKeyword: String, discountPrice: Int) {
//        self.productID = productID
//        self.model = model
//        self.sku = sku
//        self.upc = upc
//        self.ean = ean
//        self.jan = jan
//        self.isbn = isbn
//        self.mpn = mpn
//        self.location = location
//        self.quantity = quantity
//        self.stockStatusID = stockStatusID
//        self.image = image
//        self.manufacturerID = manufacturerID
//        self.shipping = shipping
//        self.price = price
//        self.points = points
//        self.taxClassID = taxClassID
//        self.dateAvailable = dateAvailable
//        self.weight = weight
//        self.weightClassID = weightClassID
//        self.length = length
//        self.width = width
//        self.height = height
//        self.lengthClassID = lengthClassID
//        self.subtract = subtract
//        self.minimum = minimum
//        self.sortOrder = sortOrder
//        self.status = status
//        self.viewed = viewed
//        self.dateAdded = dateAdded
//        self.dateModified = dateModified
//        self.languageID = languageID
//        self.name = name
//        self.description = description
//        self.tag = tag
//        self.metaTitle = metaTitle
//        self.metaDescription = metaDescription
//        self.metaKeyword = metaKeyword
//        self.discountPrice = discountPrice
//    }
//}
//
//class RelatedProduct: Codable {
//    let productID: Int
//    let model, name, sku, price: String
//    let discountPrice: Int
//    let location: String
//    let quantity: Int
//    let image: String
//    let status: Int
//    let tag, metaTitle: String
//
//    enum CodingKeys: String, CodingKey {
//        case productID = "product_id"
//        case model, name, sku, price, discountPrice, location, quantity, image, status, tag
//        case metaTitle = "meta_title"
//    }
//
//    init(productID: Int, model: String, name: String, sku: String, price: String, discountPrice: Int, location: String, quantity: Int, image: String, status: Int, tag: String, metaTitle: String) {
//        self.productID = productID
//        self.model = model
//        self.name = name
//        self.sku = sku
//        self.price = price
//        self.discountPrice = discountPrice
//        self.location = location
//        self.quantity = quantity
//        self.image = image
//        self.status = status
//        self.tag = tag
//        self.metaTitle = metaTitle
//    }
//}
//
//class Review: Codable {
//    let reviewID, productID, customerID: Int
//    let author, text: String
//    let rating, status: Int
//    let dateAdded, dateModified: String
//
//    enum CodingKeys: String, CodingKey {
//        case reviewID = "review_id"
//        case productID = "product_id"
//        case customerID = "customer_id"
//        case author, text, rating, status
//        case dateAdded = "date_added"
//        case dateModified = "date_modified"
//    }
//
//    init(reviewID: Int, productID: Int, customerID: Int, author: String, text: String, rating: Int, status: Int, dateAdded: String, dateModified: String) {
//        self.reviewID = reviewID
//        self.productID = productID
//        self.customerID = customerID
//        self.author = author
//        self.text = text
//        self.rating = rating
//        self.status = status
//        self.dateAdded = dateAdded
//        self.dateModified = dateModified
//    }
//}



class ProductDetatilsDto: Codable {
    let productDetails: [ProductDetail]
    let aditionalImages: [AditionalImage]
    let options: [Option]
    let relatedProducts: [RelatedProduct]
    let rating: Int
    let review: [Review]
    
    init(productDetails: [ProductDetail], aditionalImages: [AditionalImage], options: [Option], relatedProducts: [RelatedProduct], rating: Int, review: [Review]) {
        self.productDetails = productDetails
        self.aditionalImages = aditionalImages
        self.options = options
        self.relatedProducts = relatedProducts
        self.rating = rating
        self.review = review
    }
}

class AditionalImage: Codable {
    let productImageID, productID: Int
    let image: String
    let sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case productImageID = "product_image_id"
        case productID = "product_id"
        case image
        case sortOrder = "sort_order"
    }
    
    init(productImageID: Int, productID: Int, image: String, sortOrder: Int) {
        self.productImageID = productImageID
        self.productID = productID
        self.image = image
        self.sortOrder = sortOrder
    }
}

class Option: Codable {
    let optionDescriptionName: OptionDescriptionName
    let optionValueDescriptionName, optionValueImage: String
    let productOptionValueID, productOptionID, productID, optionID: Int
    let optionValueID, quantity, subtract: Int
    let price: String
    let pricePrefix: Prefix
    let points: Int
    let pointsPrefix: Prefix
    let weight: String
    let weightPrefix: Prefix
    
    enum CodingKeys: String, CodingKey {
        case optionDescriptionName = "option_description_name"
        case optionValueDescriptionName = "option_value_description_name"
        case optionValueImage = "option_value_image"
        case productOptionValueID = "product_option_value_id"
        case productOptionID = "product_option_id"
        case productID = "product_id"
        case optionID = "option_id"
        case optionValueID = "option_value_id"
        case quantity, subtract, price
        case pricePrefix = "price_prefix"
        case points
        case pointsPrefix = "points_prefix"
        case weight
        case weightPrefix = "weight_prefix"
    }
    
    init(optionDescriptionName: OptionDescriptionName, optionValueDescriptionName: String, optionValueImage: String, productOptionValueID: Int, productOptionID: Int, productID: Int, optionID: Int, optionValueID: Int, quantity: Int, subtract: Int, price: String, pricePrefix: Prefix, points: Int, pointsPrefix: Prefix, weight: String, weightPrefix: Prefix) {
        self.optionDescriptionName = optionDescriptionName
        self.optionValueDescriptionName = optionValueDescriptionName
        self.optionValueImage = optionValueImage
        self.productOptionValueID = productOptionValueID
        self.productOptionID = productOptionID
        self.productID = productID
        self.optionID = optionID
        self.optionValueID = optionValueID
        self.quantity = quantity
        self.subtract = subtract
        self.price = price
        self.pricePrefix = pricePrefix
        self.points = points
        self.pointsPrefix = pointsPrefix
        self.weight = weight
        self.weightPrefix = weightPrefix
    }
}

enum OptionDescriptionName: String, Codable {
    case color = "Color"
    case size = "Size"
}

enum Prefix: String, Codable {
    case empty = "+"
}

class ProductDetail: Codable {
    let productID: String
    let model, sku, upc, ean: String
    let jan, isbn, mpn, location: String
    let shipping, manufacturerID, stockStatusID, quantity, image: String
    let taxClassID, points, price: String
    let weightClassID, dateAvailable, weight: String
    let lengthClassID,length, width, height: String
    let subtract, minimum, sortOrder: String
    let status, viewed: String
    let dateAdded, dateModified: String
    let languageID: String
    let name, description, tag, metaTitle: String
    let metaDescription, metaKeyword, discountPrice: String
    
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
        case name, description, tag
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case metaKeyword = "meta_keyword"
        case discountPrice
    }
    
    init(productID: String, model: String, sku: String, upc: String, ean: String, jan: String, isbn: String, mpn: String, location: String, quantity: String, stockStatusID: String, image: String, manufacturerID: String, shipping: String, price: String, points: String, taxClassID: String, dateAvailable: String, weight: String, weightClassID: String, length: String, width: String, height: String, lengthClassID: String, subtract: String, minimum: String, sortOrder: String, status: String, viewed: String, dateAdded: String, dateModified: String, languageID: String, name: String, description: String, tag: String, metaTitle: String, metaDescription: String, metaKeyword: String, discountPrice: String) {
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
        self.description = description
        self.tag = tag
        self.metaTitle = metaTitle
        self.metaDescription = metaDescription
        self.metaKeyword = metaKeyword
        self.discountPrice = discountPrice
    }
}

class RelatedProduct: Codable {
    let productID: Int
    let model, name, sku, price: String
    let discountPrice: String?
    let location: String
    let quantity: Int
    let image: String
    let status: Int
    let tag, metaTitle: String
    
    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case model, name, sku, price, discountPrice, location, quantity, image, status, tag
        case metaTitle = "meta_title"
    }
    
    init(productID: Int, model: String, name: String, sku: String, price: String, discountPrice: String?, location: String, quantity: Int, image: String, status: Int, tag: String, metaTitle: String) {
        self.productID = productID
        self.model = model
        self.name = name
        self.sku = sku
        self.price = price
        self.discountPrice = discountPrice
        self.location = location
        self.quantity = quantity
        self.image = image
        self.status = status
        self.tag = tag
        self.metaTitle = metaTitle
    }
}

class Review: Codable {
    let reviewID, productID, customerID: Int
    let author, text: String
    let rating, status: Int
    let dateAdded, dateModified: String
    
    enum CodingKeys: String, CodingKey {
        case reviewID = "review_id"
        case productID = "product_id"
        case customerID = "customer_id"
        case author, text, rating, status
        case dateAdded = "date_added"
        case dateModified = "date_modified"
    }
    
    init(reviewID: Int, productID: Int, customerID: Int, author: String, text: String, rating: Int, status: Int, dateAdded: String, dateModified: String) {
        self.reviewID = reviewID
        self.productID = productID
        self.customerID = customerID
        self.author = author
        self.text = text
        self.rating = rating
        self.status = status
        self.dateAdded = dateAdded
        self.dateModified = dateModified
    }
}

