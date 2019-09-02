// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categoryDetailsDto = try? newJSONDecoder().decode(CategoryDetailsDto.self, from: jsonData)

import Foundation

// MARK: - CategoryDetailsDto
class CategoryDetailsDto: Codable {
    let status: Bool
    let productByCategory: [ProductByCategoryDetatils]
    
    init(status: Bool, productByCategory: [ProductByCategoryDetatils]) {
        self.status = status
        self.productByCategory = productByCategory
    }
}

// MARK: - ProductByCategory
class ProductByCategoryDetatils: Codable {
    let categoryID: Int
    let categoryName: String
    let productID: Int
    let name, image, model, sku: String
    let location: String
    let quantity: Int
    let price: String
    let specialPrice: String?
    let viewed, review: Int
    let rating: String?
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case categoryName
        case productID = "product_id"
        case name, image, model, sku, location, quantity, price, specialPrice, viewed, review, rating
    }
    
    init(categoryID: Int, categoryName: String, productID: Int, name: String, image: String, model: String, sku: String, location: String, quantity: Int, price: String, specialPrice: String?, viewed: Int, review: Int, rating: String?) {
        self.categoryID = categoryID
        self.categoryName = categoryName
        self.productID = productID
        self.name = name
        self.image = image
        self.model = model
        self.sku = sku
        self.location = location
        self.quantity = quantity
        self.price = price
        self.specialPrice = specialPrice
        self.viewed = viewed
        self.review = review
        self.rating = rating
    }
}

