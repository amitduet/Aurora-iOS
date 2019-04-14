// To parse the JSON, add this file to your project and do:
//
//   let homeDto = try? newJSONDecoder().decode(HomeDto.self, from: jsonData)

import Foundation

class HomeDto: Codable {
    let categoryID: String
    let sliders: [DiscountBanner]
    let discountProducts: [DiscountProduct]
    let newlyArrived: [NewlyArrived]
    let discountBanner: [DiscountBanner]
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case sliders
        case discountProducts = "discount_products"
        case newlyArrived = "newly_arrived"
        case discountBanner
    }
    
    init(categoryID: String, sliders: [DiscountBanner], discountProducts: [DiscountProduct], newlyArrived: [NewlyArrived], discountBanner: [DiscountBanner]) {
        self.categoryID = categoryID
        self.sliders = sliders
        self.discountProducts = discountProducts
        self.newlyArrived = newlyArrived
        self.discountBanner = discountBanner
    }
}

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

class DiscountProduct: Codable {
    let productSpecialID, productID: Int
    let name, model, image, price: String
    let oldPrice: String
    let priority, customerGroupID: Int
    let dateStart, dateEnd: String
    let categoryID: Int
    
    enum CodingKeys: String, CodingKey {
        case productSpecialID = "product_special_id"
        case productID = "product_id"
        case name, model, image, price, oldPrice, priority
        case customerGroupID = "customer_group_id"
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case categoryID = "category_id"
    }
    
    init(productSpecialID: Int, productID: Int, name: String, model: String, image: String, price: String, oldPrice: String, priority: Int, customerGroupID: Int, dateStart: String, dateEnd: String, categoryID: Int) {
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
    }
}

class NewlyArrived: Codable {
    let categoryID, productID: Int
    let name, model, sku, price: String
    let quantity: Int
    let image: String
    let manufacturerID: Int
    let manufacturerName: String
    let shipping, points: Int
    let dateAvailable, weight, length, width: String
    let height, description: String
    let stockStatus: StockStatus
    let tag, metaTitle, metaDescription, metaKeyword: String
    let dateAdded, dateModified: String
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
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
    
    init(categoryID: Int, productID: Int, name: String, model: String, sku: String, price: String, quantity: Int, image: String, manufacturerID: Int, manufacturerName: String, shipping: Int, points: Int, dateAvailable: String, weight: String, length: String, width: String, height: String, description: String, stockStatus: StockStatus, tag: String, metaTitle: String, metaDescription: String, metaKeyword: String, dateAdded: String, dateModified: String) {
        self.categoryID = categoryID
        self.productID = productID
        self.name = name
        self.model = model
        self.sku = sku
        self.price = price
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
        self.description = description
        self.stockStatus = stockStatus
        self.tag = tag
        self.metaTitle = metaTitle
        self.metaDescription = metaDescription
        self.metaKeyword = metaKeyword
        self.dateAdded = dateAdded
        self.dateModified = dateModified
    }
}

enum StockStatus: String, Codable {
    case inStock = "In Stock"
    case outOfStock = "Out Of Stock"
    case the23Days = "2-3 Days"
}

