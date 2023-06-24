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
                Rectangle()
                    .fill(.red)
                    .frame(width: 1200, height: 400)
                    .position(x: 0, y: -100)
                    .rotationEffect(Angle(degrees: 325))
                Rectangle()
                    .fill(.red)
                    .frame(width: 1200, height: 400)
                    .position(x: 110, y: 100)
                    .rotationEffect(Angle(degrees: 150))
                            Text("Start the new year off right!")
                                .font(.system(size:55))
                                .frame(width: 300, height: 500)
                                .position(x: 200, y: 230)
                            Text("GoJim!")
                                .font(.system(size:70))
                                .frame(width: 300, height: 500)
                                .position(x: 180, y: 380)
                NavigationLink(destination: ThirdView().navigationBarBackButtonHidden(true)) {
                    Text("Get Started!")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(.black)
                        .cornerRadius(15)
                        .padding()
                }.frame(maxHeight: .infinity, alignment: .bottom)
                
            }
        }
    }
    
    struct SecondView_Previews: PreviewProvider {
        static var previews: some View {
            SecondView()
        }
    }
}
