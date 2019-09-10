// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let filterDto = try? newJSONDecoder().decode(FilterDto.self, from: jsonData)

import Foundation

// MARK: - FilterDto
class FilterDto: Codable {
    let highestPrice, lowestPrice: String
    let size, color: [Color]
    
    enum CodingKeys: String, CodingKey {
        case highestPrice = "HighestPrice"
        case lowestPrice = "LowestPrice"
        case size = "Size"
        case color = "Color"
    }
    
    init(highestPrice: String, lowestPrice: String, size: [Color], color: [Color]) {
        self.highestPrice = highestPrice
        self.lowestPrice = lowestPrice
        self.size = size
        self.color = color
    }
}

// MARK: - Color
class Color: Codable {
    let filterID, languageID, filterGroupID: Int
    let name: String
    let groupName: GroupName
    
    enum CodingKeys: String, CodingKey {
        case filterID = "filter_id"
        case languageID = "language_id"
        case filterGroupID = "filter_group_id"
        case name
        case groupName = "GroupName"
    }
    
    init(filterID: Int, languageID: Int, filterGroupID: Int, name: String, groupName: GroupName) {
        self.filterID = filterID
        self.languageID = languageID
        self.filterGroupID = filterGroupID
        self.name = name
        self.groupName = groupName
    }
}

enum GroupName: String, Codable {
    case color = "Color"
    case size = "Size"
}

