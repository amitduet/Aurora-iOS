//
//  WishStatusDto.swift
//  Aurora
//
//  Created by Amit Chowdhury on 5/24/19.
//  Copyright © 2019 Amit Chowdhury. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wishStatusDto = try? newJSONDecoder().decode(WishStatusDto.self, from: jsonData)

import Foundation

// MARK: - WishStatusDto
class WishStatusDto: Codable {
    let status: Bool
    let message, productID: String
    
    enum CodingKeys: String, CodingKey {
        case status, message
        case productID = "product_id"
    }
    
    init(status: Bool, message: String, productID: String) {
        self.status = status
        self.message = message
        self.productID = productID
    }
}
