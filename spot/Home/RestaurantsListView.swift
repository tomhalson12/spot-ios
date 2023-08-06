import SwiftUI

struct Spinner: View {
  @State var angle: Double = 0.0
  @State var isAnimating = true

  var foreverAnimation: Animation {
    Animation.linear(duration: 1.0)
      .repeatForever(autoreverses: false)
  }

  var body: some View {
    Image("spotPaw")
      .resizable()
      .scaledToFill()
      .frame(maxWidth: 35.0, maxHeight: 35.0)
      .rotationEffect(Angle(degrees: self.isAnimating ? self.angle : 0.0))
      .onAppear {
        withAnimation(self.foreverAnimation) {
          self.angle = 360.0
        }
      }
  }
}

struct RestaurantsListView: View {
  var restaurants: [Restaurant]
  var isLoading: Bool

  var body: some View {
    if isLoading {
      VStack {
        Spacer()
        Spinner()
        Spacer()
        Spacer()
        Spacer()
      }.frame(maxWidth: .infinity, maxHeight: .infinity)

    } else {
      if restaurants.count > 0 {
        ScrollView(showsIndicators: false) {
          LazyVStack(spacing: 25) {
            ForEach(restaurants) { restaurant in
              NavigationLink {
                RestaurantDetailedView(restaurant: restaurant)
              } label: {
                RestaurantListView(restaurant: restaurant)
              }
            }
          }

        }.padding(.top)
      } else {
        VStack {
          Spacer()
          Text("We couldn't find any places!").font(.title2)
            .foregroundColor(.secondary)
          Spacer()
          Spacer()
          Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
      }
    }
  }
}

struct RestaurantsListView_Previews: PreviewProvider {
  static let restaurants: [Restaurant] = Bundle.main.decode("restaurants.json")

  static var previews: some View {
    RestaurantsListView(restaurants: [], isLoading: false)
//    RestaurantsListView(restaurants: [restaurants[0], restaurants[1], restaurants[2]])
  }
}
