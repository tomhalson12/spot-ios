import SwiftUI

struct FilterTagView: View {
  let text: String
  let active: Bool

  private let colour: Color

  init(text: String, active: Bool) {
    self.text = text
    self.active = active
    self.colour = active ? .primary : .secondary
  }

  var body: some View {
    Text(text)
      .textCase(.uppercase)
      .font(.footnote)
      .padding(.horizontal, 15)
      .padding(.vertical, 3)
      .foregroundColor(colour)
      .overlay(
        RoundedRectangle(cornerRadius: 30)
          .stroke(colour, lineWidth: active ? 1 : 0.5)
      )
  }
}

struct FilterTagView_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: 20) {
      FilterTagView(text: "The Name", active: false)
      FilterTagView(text: "The Name", active: true)
    }
  }
}
