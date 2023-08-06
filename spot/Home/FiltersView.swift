import SwiftUI

struct FiltersView: View {
  var activeFilters: Set<Restaurant.RestaurantType>
  var toggleFilter: (Restaurant.RestaurantType) -> Void

  var body: some View {
    HStack {
      Text("Filters")
        .textCase(.uppercase)
        .font(.headline)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(Restaurant.RestaurantType.allCases, id: \.rawValue) { type in
            FilterTagView(text: "\(type.rawValue)s", active: activeFilters.contains(type))
              .onTapGesture { toggleFilter(type) }
          }
        }.padding([.vertical, .leading], 1.0)
      }
    }
  }
}

struct FiltersView_Previews: PreviewProvider {
  static var previews: some View {
    FiltersView(activeFilters: [.restaurant], toggleFilter: { type in print(type) })
  }
}
