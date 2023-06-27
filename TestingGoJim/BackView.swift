//
//  BackView.swift
//  TestingGoJim
//
//  Created by Amaro Truong on 6/26/23.
//

import SwiftUI

struct BackView: View {
    var body: some View {
        ZStack {
            Color("LightRed")
                .ignoresSafeArea()
            VStack {
                GifImage("LatPulldown")
                    .frame(width: 250, height: 250)
                GifImage("SeatedRow")                    .frame(width: 250, height: 250)
                GifImage("RearDeltRow")
                    .frame(width: 250, height: 250)
            }
            HStack(spacing: 50) {
                NavigationLink(destination: ThirdView().navigationBarBackButtonHidden(true)) {
                    Image(systemName: "house")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 25, height: 25)
                }
                NavigationLink(destination: ChatView().navigationBarBackButtonHidden(true)) {
                    Image(systemName: "message.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 25, height: 25)
                }
                
                NavigationLink(destination: CalculatorView().navigationBarBackButtonHidden(true)) {
                    Image(systemName: "figure.strengthtraining.traditional")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 25, height: 25)
                }
                NavigationLink(destination: RunningMapView().navigationBarBackButtonHidden(true)) {
                    Image(systemName: "map.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 25, height: 25)
                }
                NavigationLink(destination: GalleryView().navigationBarBackButtonHidden(true)) {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 25, height: 25)
                }
            }
        }
    }
    
    struct BackView_Previews: PreviewProvider {
        static var previews: some View {
            BackView()
        }
    }
}
