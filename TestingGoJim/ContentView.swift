import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack
            {
                    Text("Welcome to GoJim!")
                        .font(.title)
                        .position(x: 200, y: 30)
                    Text("Our mission is to provide affordable access to fitness-tracking instruments for all gymgoers, regardless of their expertise, in hopes to encourage the development of a healthier lifestyle!")
                        .font(.system(size:24))
                        .frame(width: 300, height: 500)
                        .position(x: 200, y: 200)
                Rectangle()
                    .fill(.red)
                    .frame(width: 1200, height: 400)
                    .position(x: 110 , y: 100)
                    .rotationEffect(Angle(degrees: 150))
                NavigationLink(destination: FirstView().navigationBarBackButtonHidden(true)) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(.black)
                        .cornerRadius(15)
                        .padding()
                }.frame(maxHeight: .infinity, alignment: .bottom)
                
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
