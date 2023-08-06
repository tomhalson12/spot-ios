import SwiftUI

struct RestaurantQuickInfo: View {
  var restaurant: Restaurant

  var body: some View {
    HStack(spacing: 20) {
      Text(restaurant.priceText)
      Text(restaurant.type.rawValue)
      Text(restaurant.cuisine.rawValue)
    }.font(.subheadline).textCase(.uppercase)
  }
}

struct RestaurantQuickInfo_Previews: PreviewProvider {
  static let restaurants: [Restaurant] = Bundle.main.decode("restaurants.json")

  static var previews: some View {
    RestaurantQuickInfo(restaurant: restaurants[2])
  }
}
