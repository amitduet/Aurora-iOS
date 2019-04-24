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

class ProductDetatilsDto: Codable {
    let productDetails: [ProductDetail]
    let aditionalImages: [AditionalImage]
    let options, relatedProducts: [JSONAny]
    let rating: Int
    let review: [JSONAny]
    
    init(productDetails: [ProductDetail], aditionalImages: [AditionalImage], options: [JSONAny], relatedProducts: [JSONAny], rating: Int, review: [JSONAny]) {
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

class ProductDetail: Codable {
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
    let name, description, tag, metaTitle: String
    let metaDescription, metaKeyword: String
    let discountPrice: JSONNull?
    
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
    
    init(productID: Int, model: String, sku: String, upc: String, ean: String, jan: String, isbn: String, mpn: String, location: String, quantity: Int, stockStatusID: Int, image: String, manufacturerID: Int, shipping: Int, price: String, points: Int, taxClassID: Int, dateAvailable: String, weight: String, weightClassID: Int, length: String, width: String, height: String, lengthClassID: Int, subtract: Int, minimum: Int, sortOrder: Int, status: Int, viewed: Int, dateAdded: String, dateModified: String, languageID: Int, name: String, description: String, tag: String, metaTitle: String, metaDescription: String, metaKeyword: String, discountPrice: JSONNull?) {
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

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}


