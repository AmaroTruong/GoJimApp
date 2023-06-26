import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack
            {
                Color("LightRed")
                    .ignoresSafeArea()
                Image(systemName: "dumbbell")
                    .font(.system(size:120))
                    .position(x: 100 , y: 140)
                    .rotationEffect(Angle(degrees: 225))
                Image(systemName: "figure.run")
                    .font(.system(size:120))
                    .position(x: -70 , y: 270)
                    .rotationEffect(Angle(degrees: 40))
                Image(systemName: "figure.cooldown")
                    .font(.system(size:100))
                    .position(x: 380 , y: 390)
                    .rotationEffect(Angle(degrees: -10))
                
                VStack{
                    Text("GoJim!")
                        .position(x: 210, y: 20)
                        .font(.system(size:23))
                    Text("Welcome Back!")
                        .frame(width: 300, height: 300)
                        .font(.system(size: 60))
                        .position(x: 150, y: 110)
                    NavigationLink(destination: FirstView().navigationBarBackButtonHidden(true)) {
                        Label("Start", systemImage: "dumbbell")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .frame(width: 200, height: 40)
                                    .background(Color.black)
                                    .cornerRadius(15)
                                    .padding()
                    }.buttonStyle(BlackButtonStyle())
                        .position(x: 300, y: 200)
                        }
                    }.frame(maxHeight: .infinity, alignment: .bottom)
                    
                }
            }
    
    struct BlackButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(width: 150, height: 150)
                .foregroundColor(Color.white)
                .background(Color.black)
                .clipShape(Circle())
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
