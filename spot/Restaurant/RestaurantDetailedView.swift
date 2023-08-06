import SwiftUI

struct RestaurantDetailedView: View {
  var restaurant: Restaurant

  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack(alignment: .leading, spacing: 10) {
        RestaurantPhotoView(photo: restaurant.photo, size: 200, clipped: true)
        Group {
          Text(restaurant.name)
            .fontWeight(.heavy)
            .font(.title3)
            .textCase(.uppercase)
          
          RestaurantQuickInfo(restaurant: restaurant)
        }
          
        Group {
          RestaurantKeyInfoView(info: restaurant.address, sfSymbolName: "mappin.and.ellipse")
          RestaurantKeyInfoView(info: restaurant.phone, sfSymbolName: "phone")
          RestaurantKeyInfoView(info: restaurant.tip, sfSymbolName: "lightbulb")
        }
          
        Divider().padding([.vertical])
          
        Text(restaurant.desc)
          
        Group {
          Text("We love")
            .fontWeight(.heavy)
            .font(.subheadline)
            .textCase(.uppercase)
            .padding(.top)
          
          VStack(alignment: .leading, spacing: 5) {
            ForEach(restaurant.suggestedFood, id: \.self) { food in
              HStack {
                Image(systemName: "circle.fill").font(.system(size: 6))
                Text(food)
              }
            }
          }.padding([.leading])
        }
        
      }.font(.footnote)
    }.padding()
  }
}

struct RestaurantDetailedView_Previews: PreviewProvider {
  static let restaurants: [Restaurant] = Bundle.main.decode("restaurants.json")
  
  static var previews: some View {
    RestaurantDetailedView(restaurant: restaurants[1])
  }
}
