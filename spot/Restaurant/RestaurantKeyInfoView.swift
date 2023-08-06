import SwiftUI

struct RestaurantKeyInfoView: View {
  var info: String
  var sfSymbolName: String

  var body: some View {
    HStack(alignment: .top) {
      Image(systemName: sfSymbolName).font(.system(size: 15))
      Text(info)
    }
  }
}

struct RestaurantKeyInfoView_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantKeyInfoView(info: "some info", sfSymbolName: "phone")
  }
}
