

import SwiftUI

struct RestaurantPhotoView: View {
  var photo: String?
  var size: CGFloat
  var clipped: Bool = false

  private var clippedCornerRadius: CGFloat {
    clipped ? 20 : 0
  }

  var body: some View {
    if photo != nil {
      Image(photo!)
        .resizable()
        .scaledToFill()
        .frame(maxHeight: size)
        .clipShape(RoundedRectangle(cornerRadius: clippedCornerRadius))
        .clipped()
    } else {
      Image(systemName: "fork.knife.circle")
        .frame(height: size)
        .font(.system(size: size * 0.45))
        .foregroundColor(.secondary)
    }
  }
}

struct RestaurantPhotoView_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantPhotoView(photo: "crownandrose", size: 200)
  }
}
