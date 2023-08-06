import SwiftUI

extension HomeView {
  @MainActor class SpotModel: ObservableObject {
    @Published private(set) var restaurants: [Restaurant]
    @Published private(set) var typeFilters: Set<Restaurant.RestaurantType>
    @Published private(set) var cuisineFilters: Set<Cuisine>
    @Published private(set) var isLoading: Bool
    private var timer: Timer?

    func simulateLoading() {
      timer?.invalidate()
      isLoading = true
      timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
        self?.isLoading = false
      }
    }

    var filteredRestaurants: [Restaurant] {
      return restaurants.filter { restaurant in
        (cuisineFilters.isEmpty || cuisineFilters.contains(restaurant.cuisine)) &&
          (typeFilters.isEmpty || typeFilters.contains(restaurant.type))
      }
    }

    func toggleTypeFilter(_ type: Restaurant.RestaurantType) {
      simulateLoading()
      if typeFilters.contains(type) {
        typeFilters.remove(type)
      } else {
        typeFilters.insert(type)
      }
    }

    func toggleCuisineFilter(_ cuisine: Cuisine) {
      simulateLoading()
      if cuisineFilters.contains(cuisine) {
        cuisineFilters.remove(cuisine)
      } else {
        cuisineFilters.insert(cuisine)
      }
    }

    init() {
      restaurants = Bundle.main.decode("restaurants.json")
      typeFilters = []
      cuisineFilters = []
      isLoading = false
      simulateLoading()
    }
  }
}
