import SwiftUI

struct CuisineListView: View {
  var activeFilters: Set<Cuisine>
  var toggleFilter: (Cuisine) -> Void

  var body: some View {
    VStack(alignment: .leading) {
      Text("I'm looking for...")
        .textCase(.uppercase)
        .font(.headline)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(Cuisine.allCases, id: \.rawValue) { cuisine in
            CuisineView(cuisine: cuisine, active: activeFilters.contains(cuisine)).onTapGesture {
              toggleFilter(cuisine)
            }
          }
        }.padding([.top, .leading], 1.0)
      }
    }.padding(.vertical, 5)
  }
}

struct CuisineListView_Previews: PreviewProvider {
  static var previews: some View {
    CuisineListView(activeFilters: [.british, .chinese], toggleFilter: { cuisine in print(cuisine) })
  }
}
