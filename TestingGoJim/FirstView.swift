//
//  SwiftUIView.swift
//  GoJim
//
//  Created by Jackie Cheng on 6/22/23.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            ZStack
            {
                Color("LightRed")
                Image(systemName: "dumbbell")
                    .font(.system(size:120))
                    .position(x: 100 , y: 150)
                    .rotationEffect(Angle(degrees: 225))
                Image(systemName: "figure.run")
                    .font(.system(size:120))
                    .position(x: -70 , y: 270)
                    .rotationEffect(Angle(degrees: 40))
                Image(systemName: "figure.cooldown")
                    .font(.system(size:100))
                    .position(x: 410 , y: 390)
                    .rotationEffect(Angle(degrees: -10))
                VStack {
                    Text("Personal trainers and fitness apps are all paywalled and complicated. We would like to introduce GoJim!")
                        .font(.system(size:30))
                        .frame(width: 250, height: 500)
                        .position(x: 200, y: 450)
                    NavigationLink(destination: SecondView().navigationBarBackButtonHidden(true)) {
                        Text("Continue")
                            .font(.system(size:25))
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(.black)
                            .cornerRadius(15)
                            .padding()
                    }.buttonStyle(BlackButtonStyle())
                        .position(x: 330, y: 370)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    
                }
            }
            .ignoresSafeArea()
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
    
    struct FirstView_Previews: PreviewProvider {
        static var previews: some View {
            FirstView()
        }
    }
}
