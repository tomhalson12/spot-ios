import SwiftUI

let CARD_HEIGHT: CGFloat = 270.0
let CARD_INFO_HEIGHT: CGFloat = 135.0

struct RestaurantListView: View {
  var restaurant: Restaurant
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(.white)
        .frame(maxHeight: .infinity)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.quaternary, lineWidth: 2))
      
      VStack(spacing: 0) {
        RestaurantPhotoView(photo: restaurant.photo, size: CARD_HEIGHT - CARD_INFO_HEIGHT)

        VStack(alignment: .leading, spacing: 5) {
          HStack(alignment: .top) {
            Text(restaurant.name)
              .fontWeight(.heavy)
              .font(.headline)
              .fixedSize(horizontal: false, vertical: true)
          
            Spacer()
              
            RestaurantKeyInfoView(info: restaurant.location, sfSymbolName: "mappin.and.ellipse")
              .font(.subheadline)
          }
            
          RestaurantQuickInfo(restaurant: restaurant)
          Spacer()
          Text(restaurant.shortDesc)
            .font(.caption2)
            .textCase(.none)
            .fixedSize(horizontal: false, vertical: true)
            
        }.padding()
          .frame(minHeight: CARD_INFO_HEIGHT, maxHeight: CARD_INFO_HEIGHT)
          .textCase(.uppercase)
          .multilineTextAlignment(.leading)
        
      }.frame(maxHeight: CARD_HEIGHT).foregroundColor(.black)
    }.frame(maxHeight: CARD_HEIGHT)
      .clipShape(RoundedRectangle(cornerRadius: 20))
  }
}

struct RestaurantListView_Previews: PreviewProvider {
  static let restaurants: [Restaurant] = Bundle.main.decode("restaurants.json")
    
  static var previews: some View {
    VStack {
      RestaurantListView(restaurant: restaurants[13]).padding()
      RestaurantListView(restaurant: restaurants[1]).padding()
    }
  }
}
