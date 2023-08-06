import Foundation
import SwiftUI

class Restaurant: Codable, Identifiable {
  enum RestaurantType: String, Codable, CaseIterable { case pub, restaurant, bar, cafe }
  
  var id: UUID = .init()
  var name: String
  var location: String
  var address: String
  var desc: String
  var shortDesc: String
  var tip: String
  var type: RestaurantType
  var cuisine: Cuisine
  var price: Int
  var phone: String
  var suggestedFood: [String]
  var photo: String?
  
  init(id: UUID?, name: String, location: String, address: String, type: RestaurantType, cuisine: Cuisine, phone: String, desc: String, shortDesc: String, tip: String, price: Int, suggestedFood: [String], photo: String?) {
    self.id = id ?? UUID()
    self.name = name
    self.location = location
    self.address = address
    self.desc = desc
    self.shortDesc = shortDesc
    self.price = price
    self.type = type
    self.cuisine = cuisine
    self.phone = phone
    self.tip = tip
    self.suggestedFood = suggestedFood
    
    self.photo = photo
  }
  
  var priceText: String {
    return String(repeating: "£", count: price)
  }
  
  enum CodingKeys: String, CodingKey {
    case name, location, address, desc, shortDesc, tip, type, cuisine, price, phone, suggestedFood, photo
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = .init()
    name = try container.decode(String.self, forKey: .name)
    location = try container.decode(String.self, forKey: .location)
    address = try container.decode(String.self, forKey: .address)
    desc = try container.decode(String.self, forKey: .desc)
    shortDesc = try container.decode(String.self, forKey: .shortDesc)
    tip = try container.decode(String.self, forKey: .tip)
    type = try container.decode(RestaurantType.self, forKey: .type)
    cuisine = try container.decode(Cuisine.self, forKey: .cuisine)
    phone = try container.decode(String.self, forKey: .phone)
    price = try container.decode(Int.self, forKey: .price)
    suggestedFood = try container.decode([String].self, forKey: .suggestedFood)
    photo = try container.decodeIfPresent(String.self, forKey: .photo)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(location, forKey: .location)
    try container.encode(address, forKey: .address)
    try container.encode(desc, forKey: .desc)
    try container.encode(shortDesc, forKey: .shortDesc)
    try container.encode(tip, forKey: .tip)
    try container.encode(type, forKey: .type)
    try container.encode(cuisine, forKey: .cuisine)
    try container.encode(phone, forKey: .phone)
    try container.encode(price, forKey: .price)
    try container.encode(suggestedFood, forKey: .suggestedFood)
    try container.encode(photo, forKey: .photo)
  }
}
