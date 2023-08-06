import SwiftUI

struct Arc: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    //Top left
    path.move(to: CGPoint(x: rect.minX, y: rect.minX))
    //Left vertical bound
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.85))
    //Curve
    path.addCurve(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.78), control1: CGPoint(x: rect.maxX * 0.35, y: rect.maxY), control2: CGPoint(x: rect.maxX * 0.7, y: rect.maxY))
    //Right vertical bound
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
    
    return path
  }
}

struct LandingPageView: View {
  @State private var showHome: Bool = false
  
  var body: some View {
    NavigationStack {
      VStack{
        VStack(spacing: 50){
          Image("SpotLogo")
            .resizable()
            .scaledToFit()
            .frame(width:  150)
          
          GeometryReader { ge in
            Image("LandingPageIcon")
              .resizable()
              .scaledToFit()
              .frame(width: ge.size.width * 0.7)
              .frame(width: ge.size.width * 0.90, height: ge.size.height * 0.9)
          }
        }.padding(.top, 30)
        
        
        ZStack{
          Arc()
            .fill(Color("SpotGreen"))
            .frame(height: 400)
            .rotationEffect(Angle(degrees: 180))
          
          VStack(spacing: 20) {
            Spacer()
            Text("Your guide to dog friendly dining")
              .foregroundColor(.white)
              .fontWeight(.bold)
              .font(.system(size: 35))
              .multilineTextAlignment(.center)
            
            Text("Find a restaurant where you can bring your four legged friend")
              .multilineTextAlignment(.center)
            
            Button {
              showHome.toggle()
            } label: {
              Text("Search")
            }.padding(.vertical,12)
              .padding(.horizontal, 45)
              .background(.white)
              .foregroundColor(.black)
              .clipShape(RoundedRectangle(cornerRadius: 15))
            
          }.font(.system(size: 18))
            .padding(.top)
            .frame( width: 300, height: 260)
          
        }
        
      }.ignoresSafeArea(.all, edges: .bottom)
        .preferredColorScheme(.light)
        .navigationDestination(isPresented: $showHome) {
          HomeView().navigationBarBackButtonHidden(true)
        }
      
    }
  }
}

struct LandingPageView_Previews: PreviewProvider {
  static var previews: some View {
    LandingPageView()
  }
}
