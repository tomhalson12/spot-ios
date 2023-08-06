import SwiftUI

struct HomeView: View {
  @StateObject private var spotModel = SpotModel()

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        Image("SpotLogo")
          .resizable()
          .scaledToFit()
          .frame(width: 100)

        CuisineListView(activeFilters: spotModel.cuisineFilters, toggleFilter: { spotModel.toggleCuisineFilter($0) })

        FiltersView(activeFilters: spotModel.typeFilters, toggleFilter: { spotModel.toggleTypeFilter($0) })

        Divider().padding(.bottom, 5)

        RestaurantsListView(restaurants: spotModel.filteredRestaurants, isLoading: spotModel.isLoading)
      }.padding(.horizontal)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
