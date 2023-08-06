import SwiftUI

let CUISINE_HEIGHT: CGFloat = 80.0

struct CuisineView: View {
  var cuisine: Cuisine
  var active: Bool

  var borderColour: Color { active ? .primary : .secondary }
  var borderRadius: CGFloat { active ? 2 : 0.5 }

  var body: some View {
    VStack {
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .stroke(borderColour, lineWidth: borderRadius)

        GeometryReader { geo in
          VStack {
            Image(cuisine.rawValue)
              .resizable()
              .scaledToFit()
              .frame(width: geo.size.width * 0.65)
          }.frame(
            maxWidth: .infinity,
            maxHeight: .infinity
          )
        }
      }.frame(width: CUISINE_HEIGHT, height: CUISINE_HEIGHT)

      Text(cuisine.rawValue)
        .textCase(.uppercase)
        .font(.footnote)
    }
  }
}

struct CuisineView_Previews_Container: View {
  let columns = [GridItem(.adaptive(minimum: 80))]

  var body: some View {
    LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
      ForEach(Cuisine.allCases, id: \.rawValue) { c in
        CuisineView(cuisine: c, active: Bool.random())
      }
    }.padding()
  }
}

struct CuisineView_Previews: PreviewProvider {
  static var previews: some View {
    CuisineView_Previews_Container()
  }
}
