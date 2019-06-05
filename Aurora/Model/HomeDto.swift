//// To parse the JSON, add this file to your project and do:
////
////   let homeDto = try? newJSONDecoder().decode(HomeDto.self, from: jsonData)
//
//import Foundation
//
//class HomeDto: Codable {
//    let categoryID: String
//    let sliders: [DiscountBanner]
//    let discountProducts: [DiscountProduct]
//    let newlyArrived, latestProducts: [LatestProduct]
//    let discountBanner: [DiscountBanner]
//
//    enum CodingKeys: String, CodingKey {
//        case categoryID = "categoryId"
//        case sliders
//        case discountProducts = "discount_products"
//        case newlyArrived = "newly_arrived"
//        case latestProducts = "latest_products"
//        case discountBanner
//    }
//
//    init(categoryID: String, sliders: [DiscountBanner], discountProducts: [DiscountProduct], newlyArrived: [LatestProduct], latestProducts: [LatestProduct], discountBanner: [DiscountBanner]) {
//        self.categoryID = categoryID
//        self.sliders = sliders
//        self.discountProducts = discountProducts
//        self.newlyArrived = newlyArrived
//        self.latestProducts = latestProducts
//        self.discountBanner = discountBanner
//    }
//}
//
//class DiscountBanner: Codable {
//    let bannerImageID, bannerID, languageID: Int
//    let title, link, image: String
//    let sortOrder: Int
//
//    enum CodingKeys: String, CodingKey {
//        case bannerImageID = "banner_image_id"
//        case bannerID = "banner_id"
//        case languageID = "language_id"
//        case title, link, image
//        case sortOrder = "sort_order"
//    }
//
//    init(bannerImageID: Int, bannerID: Int, languageID: Int, title: String, link: String, image: String, sortOrder: Int) {
//        self.bannerImageID = bannerImageID
//        self.bannerID = bannerID
//        self.languageID = languageID
//        self.title = title
//        self.link = link
//        self.image = image
//        self.sortOrder = sortOrder
//    }
//}
//
//class DiscountProduct: Codable {
//    let productSpecialID, productID: Int
//    let name, model, image, price, oldPrice: String
//    let priority, customerGroupID: Int
//    let dateStart, dateEnd: String
//    let categoryID: Int
//
//    enum CodingKeys: String, CodingKey {
//        case productSpecialID = "product_special_id"
//        case productID = "product_id"
//        case name, model, image, price, oldPrice, priority
//        case customerGroupID = "customer_group_id"
//        case dateStart = "date_start"
//        case dateEnd = "date_end"
//        case categoryID = "category_id"
//    }
//
//    init(productSpecialID: Int, productID: Int, name: String, model: String, image: String, price: String, oldPrice: String, priority: Int, customerGroupID: Int, dateStart: String, dateEnd: String, categoryID: Int) {
//        self.productSpecialID = productSpecialID
//        self.productID = productID
//        self.name = name
//        self.model = model
//        self.image = image
//        self.price = price
//        self.oldPrice = oldPrice
//        self.priority = priority
//        self.customerGroupID = customerGroupID
//        self.dateStart = dateStart
//        self.dateEnd = dateEnd
//        self.categoryID = categoryID
//    }
//}
//
////enum Name: String, Codable {
////    case blueShirt = "Blue Shirt"
////    case denimShirt = "Denim Shirt"
////    case empty = ""
////    case jeansMenPant = "jeans, men, pant,"
////}
//
//class LatestProduct: Codable {
//    let categoryID, productID: Int
//    let name, model, sku, price: String
//    let discountPrice: JSONNull?
//    let quantity: Int
//    let image: String
//    let manufacturerID: Int
//    let manufacturerName: ManufacturerName?
//    let shipping, points: Int
//    let dateAvailable, weight, length, width: String
//    let height, description: String
//    let stockStatus: StockStatus
//    let tag,metaTitle: String
//    let metaDescription: MetaDescription
//    let metaKeyword: MetaKeyword
//    let dateAdded, dateModified: String
//
//    enum CodingKeys: String, CodingKey {
//        case categoryID = "category_id"
//        case productID = "product_id"
//        case name, model, sku, price, discountPrice, quantity, image
//        case manufacturerID = "manufacturer_id"
//        case manufacturerName, shipping, points
//        case dateAvailable = "date_available"
//        case weight, length, width, height, description, stockStatus, tag
//        case metaTitle = "meta_title"
//        case metaDescription = "meta_description"
//        case metaKeyword = "meta_keyword"
//        case dateAdded = "date_added"
//        case dateModified = "date_modified"
//    }
//
//    init(categoryID: Int, productID: Int, name: String, model: String, sku: String, price: String, discountPrice: JSONNull?, quantity: Int, image: String, manufacturerID: Int, manufacturerName: ManufacturerName?, shipping: Int, points: Int, dateAvailable: String, weight: String, length: String, width: String, height: String, description: String, stockStatus: StockStatus, tag: String, metaTitle: String, metaDescription: MetaDescription, metaKeyword: MetaKeyword, dateAdded: String, dateModified: String) {
//        self.categoryID = categoryID
//        self.productID = productID
//        self.name = name
//        self.model = model
//        self.sku = sku
//        self.price = price
//        self.discountPrice = discountPrice
//        self.quantity = quantity
//        self.image = image
//        self.manufacturerID = manufacturerID
//        self.manufacturerName = manufacturerName
//        self.shipping = shipping
//        self.points = points
//        self.dateAvailable = dateAvailable
//        self.weight = weight
//        self.length = length
//        self.width = width
//        self.height = height
//        self.description = description
//        self.stockStatus = stockStatus
//        self.tag = tag
//        self.metaTitle = metaTitle
//        self.metaDescription = metaDescription
//        self.metaKeyword = metaKeyword
//        self.dateAdded = dateAdded
//        self.dateModified = dateModified
//    }
//}
//
//enum ManufacturerName: String, Codable {
//    case adidas = "Adidas "
//    case denim = "Denim"
//}
//
//enum MetaDescription: String, Codable {
//    case empty = ""
//    case jeansPantForMen = "Jeans Pant for men"
//    case shirtDescription = "Shirt description"
//}
//
//enum MetaKeyword: String, Codable {
//    case empty = ""
//    case jeansPant = "Jeans Pant "
//    case shirt = "Shirt"
//}
//
//enum StockStatus: String, Codable {
//    case inStock = "In Stock"
//    case outOfStock = "Out Of Stock"
//    case the23Days = "2-3 Days"
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let homeDto = try? newJSONDecoder().decode(HomeDto.self, from: jsonData)

//import Foundation
//
//// MARK: - HomeDto
//class HomeDto: Codable {
//    let categoryID: String
//    let sliders: [DiscountBanner]
//    let discountProducts: [DiscountProduct]
//    let newlyArrived, latestProducts: [LatestProduct]
//    let discountBanner: [DiscountBanner]
//
//    enum CodingKeys: String, CodingKey {
//        case categoryID = "categoryId"
//        case sliders
//        case discountProducts = "discount_products"
//        case newlyArrived = "newly_arrived"
//        case latestProducts = "latest_products"
//        case discountBanner
//    }
//
//    init(categoryID: String, sliders: [DiscountBanner], discountProducts: [DiscountProduct], newlyArrived: [LatestProduct], latestProducts: [LatestProduct], discountBanner: [DiscountBanner]) {
//        self.categoryID = categoryID
//        self.sliders = sliders
//        self.discountProducts = discountProducts
//        self.newlyArrived = newlyArrived
//        self.latestProducts = latestProducts
//        self.discountBanner = discountBanner
//    }
//}
//
//// MARK: - DiscountBanner
//class DiscountBanner: Codable {
//    let bannerImageID, bannerID, languageID: Int
//    let title, link, image: String
//    let sortOrder: Int
//
//    enum CodingKeys: String, CodingKey {
//        case bannerImageID = "banner_image_id"
//        case bannerID = "banner_id"
//        case languageID = "language_id"
//        case title, link, image
//        case sortOrder = "sort_order"
//    }
//
//    init(bannerImageID: Int, bannerID: Int, languageID: Int, title: String, link: String, image: String, sortOrder: Int) {
//        self.bannerImageID = bannerImageID
//        self.bannerID = bannerID
//        self.languageID = languageID
//        self.title = title
//        self.link = link
//        self.image = image
//        self.sortOrder = sortOrder
//    }
//}
//
//// MARK: - DiscountProduct
//class DiscountProduct: Codable {
//    let productSpecialID, productID: Int
//    let name, model, image, price: String
//    let oldPrice: String
//    let priority, customerGroupID: Int
//    let dateStart, dateEnd: String
//    let categoryID: Int
//
//    enum CodingKeys: String, CodingKey {
//        case productSpecialID = "product_special_id"
//        case productID = "product_id"
//        case name, model, image, price, oldPrice, priority
//        case customerGroupID = "customer_group_id"
//        case dateStart = "date_start"
//        case dateEnd = "date_end"
//        case categoryID = "category_id"
//    }
//
//    init(productSpecialID: Int, productID: Int, name: String, model: String, image: String, price: String, oldPrice: String, priority: Int, customerGroupID: Int, dateStart: String, dateEnd: String, categoryID: Int) {
//        self.productSpecialID = productSpecialID
//        self.productID = productID
//        self.name = name
//        self.model = model
//        self.image = image
//        self.price = price
//        self.oldPrice = oldPrice
//        self.priority = priority
//        self.customerGroupID = customerGroupID
//        self.dateStart = dateStart
//        self.dateEnd = dateEnd
//        self.categoryID = categoryID
//    }
//}
//
//// MARK: - LatestProduct
//class LatestProduct: Codable {
//    let categoryID, productID: Int
//    let name, model, sku, price: String
//    let discountPrice: String?
//    let quantity: Int
//    let image: String
//    let manufacturerID: Int
//    let manufacturerName: String
//    let shipping, points: Int
//    let dateAvailable, weight, length, width: String
//    let height, latestProductDescription, stockStatus, tag: String
//    let metaTitle, metaDescription, metaKeyword, dateAdded: String
//    let dateModified: String
//
//    enum CodingKeys: String, CodingKey {
//        case categoryID = "category_id"
//        case productID = "product_id"
//        case name, model, sku, price, discountPrice, quantity, image
//        case manufacturerID = "manufacturer_id"
//        case manufacturerName, shipping, points
//        case dateAvailable = "date_available"
//        case weight, length, width, height
//        case latestProductDescription = "description"
//        case stockStatus, tag
//        case metaTitle = "meta_title"
//        case metaDescription = "meta_description"
//        case metaKeyword = "meta_keyword"
//        case dateAdded = "date_added"
//        case dateModified = "date_modified"
//    }
//
//    init(categoryID: Int, productID: Int, name: String, model: String, sku: String, price: String, discountPrice: String?, quantity: Int, image: String, manufacturerID: Int, manufacturerName: String, shipping: Int, points: Int, dateAvailable: String, weight: String, length: String, width: String, height: String, latestProductDescription: String, stockStatus: String, tag: String, metaTitle: String, metaDescription: String, metaKeyword: String, dateAdded: String, dateModified: String) {
//        self.categoryID = categoryID
//        self.productID = productID
//        self.name = name
//        self.model = model
//        self.sku = sku
//        self.price = price
//        self.discountPrice = discountPrice
//        self.quantity = quantity
//        self.image = image
//        self.manufacturerID = manufacturerID
//        self.manufacturerName = manufacturerName
//        self.shipping = shipping
//        self.points = points
//        self.dateAvailable = dateAvailable
//        self.weight = weight
//        self.length = length
//        self.width = width
//        self.height = height
//        self.latestProductDescription = latestProductDescription
//        self.stockStatus = stockStatus
//        self.tag = tag
//        self.metaTitle = metaTitle
//        self.metaDescription = metaDescription
//        self.metaKeyword = metaKeyword
//        self.dateAdded = dateAdded
//        self.dateModified = dateModified
//    }
//}

//4-6-2019

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let homeDto = try? newJSONDecoder().decode(HomeDto.self, from: jsonData)

import Foundation

// MARK: - HomeDto
class HomeDto: Codable {
    let categoryID: String
    let sliders: [DiscountBanner]
    let discountProducts: [DiscountProduct]
    let newlyArrived: [JSONAny]
    let latestProducts: [LatestProduct]
    let discountBanner: [DiscountBanner]
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case sliders
        case discountProducts = "discount_products"
        case newlyArrived = "newly_arrived"
        case latestProducts = "latest_products"
        case discountBanner
    }
    
    init(categoryID: String, sliders: [DiscountBanner], discountProducts: [DiscountProduct], newlyArrived: [JSONAny], latestProducts: [LatestProduct], discountBanner: [DiscountBanner]) {
        self.categoryID = categoryID
        self.sliders = sliders
        self.discountProducts = discountProducts
        self.newlyArrived = newlyArrived
        self.latestProducts = latestProducts
        self.discountBanner = discountBanner
    }
}

// MARK: - DiscountBanner
class DiscountBanner: Codable {
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
    
    init(bannerImageID: Int, bannerID: Int, languageID: Int, title: String, link: String, image: String, sortOrder: Int) {
        self.bannerImageID = bannerImageID
        self.bannerID = bannerID
        self.languageID = languageID
        self.title = title
        self.link = link
        self.image = image
        self.sortOrder = sortOrder
    }
}

// MARK: - DiscountProduct
class DiscountProduct: Codable {
    let productSpecialID, productID, name, model: String
    let image, price, oldPrice, priority: String
    let customerGroupID, dateStart, dateEnd, categoryID: String
    let discountProductDescription: String
    
    enum CodingKeys: String, CodingKey {
        case productSpecialID = "product_special_id"
        case productID = "product_id"
        case name, model, image, price, oldPrice, priority
        case customerGroupID = "customer_group_id"
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case categoryID = "category_id"
        case discountProductDescription = "description"
    }
    
    init(productSpecialID: String, productID: String, name: String, model: String, image: String, price: String, oldPrice: String, priority: String, customerGroupID: String, dateStart: String, dateEnd: String, categoryID: String, discountProductDescription: String) {
        self.productSpecialID = productSpecialID
        self.productID = productID
        self.name = name
        self.model = model
        self.image = image
        self.price = price
        self.oldPrice = oldPrice
        self.priority = priority
        self.customerGroupID = customerGroupID
        self.dateStart = dateStart
        self.dateEnd = dateEnd
        self.categoryID = categoryID
        self.discountProductDescription = discountProductDescription
    }
}

// MARK: - LatestProduct
class LatestProduct: Codable {
    let categoryID, productID, name, model: String
    let sku, price, discountPrice, quantity: String
    let image, manufacturerID, manufacturerName, shipping: String
    let points, dateAvailable, weight, length: String
    let width, height, latestProductDescription, stockStatus: String
    let tag, metaTitle, metaDescription, metaKeyword: String
    let dateAdded, dateModified: String
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case productID = "product_id"
        case name, model, sku, price, discountPrice, quantity, image
        case manufacturerID = "manufacturer_id"
        case manufacturerName, shipping, points
        case dateAvailable = "date_available"
        case weight, length, width, height
        case latestProductDescription = "description"
        case stockStatus, tag
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case metaKeyword = "meta_keyword"
        case dateAdded = "date_added"
        case dateModified = "date_modified"
    }
    
    init(categoryID: String, productID: String, name: String, model: String, sku: String, price: String, discountPrice: String, quantity: String, image: String, manufacturerID: String, manufacturerName: String, shipping: String, points: String, dateAvailable: String, weight: String, length: String, width: String, height: String, latestProductDescription: String, stockStatus: String, tag: String, metaTitle: String, metaDescription: String, metaKeyword: String, dateAdded: String, dateModified: String) {
        self.categoryID = categoryID
        self.productID = productID
        self.name = name
        self.model = model
        self.sku = sku
        self.price = price
        self.discountPrice = discountPrice
        self.quantity = quantity
        self.image = image
        self.manufacturerID = manufacturerID
        self.manufacturerName = manufacturerName
        self.shipping = shipping
        self.points = points
        self.dateAvailable = dateAvailable
        self.weight = weight
        self.length = length
        self.width = width
        self.height = height
        self.latestProductDescription = latestProductDescription
        self.stockStatus = stockStatus
        self.tag = tag
        self.metaTitle = metaTitle
        self.metaDescription = metaDescription
        self.metaKeyword = metaKeyword
        self.dateAdded = dateAdded
        self.dateModified = dateModified
    }
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//    
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//    
//    public var hashValue: Int {
//        return 0
//    }
//    
//    public init() {}
//    
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//    
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}

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

