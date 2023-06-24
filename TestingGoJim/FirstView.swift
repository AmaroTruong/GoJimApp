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
                    Text("2023 just started. What a great time to start working out, but how do you start? Personal trainers and fitness apps are all paywalled and complicated. We would like to introduce GoJim!, a fitness-tracking software to track calories, log your exercises, and communicate with other gym goers.")
                        .font(.system(size:25))
                        .frame(width: 300, height: 500)
                        .position(x: 200, y: 250)
                Rectangle()
                    .fill(.red)
                    .frame(width: 1200, height: 400)
                    .position(x: 110 , y: 100)
                    .rotationEffect(Angle(degrees: 150))
                NavigationLink(destination: SecondView().navigationBarBackButtonHidden(true)) {
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
    
    struct FirstView_Previews: PreviewProvider {
        static var previews: some View {
            FirstView()
        }
    }
}
