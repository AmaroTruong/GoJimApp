//
//  ThirdView.swift
//  GoJim
//
//  Created by Jackie Cheng on 6/22/23.
//
import SwiftUI

struct SecondView: View {
    var body: some View {
        NavigationView {
            ZStack
            {
                Color("LightRed")
                Image(systemName: "dumbbell")
                    .font(.system(size:120))
                    .position(x: 45 , y: 120)
                    .rotationEffect(Angle(degrees: 225))
                VStack {
                    Text("Sweat Today For a Better Tomorrow!")
                        .font(.system(size:55))
                        .frame(width: 300, height: 500)
                        .position(x: 225, y: 270)
                    Image("logo")
                        .resizable()
                        .frame(width: 400, height: 100)
                        .position(x: 200, y: 200)
                    NavigationLink(destination: ThirdView().navigationBarBackButtonHidden(true)) {
                        Text("Continue")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(.black)
                            .cornerRadius(15)
                            .padding()
                    }.buttonStyle(BlackButtonStyle())
                        .position(x: 330, y: 200)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                }
            }.ignoresSafeArea()
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
    
    struct SecondView_Previews: PreviewProvider {
        static var previews: some View {
            SecondView()
        }
    }
}
