//
//  LegView.swift
//  TestingGoJim
//
//  Created by Amaro Truong on 6/26/23.
//


import SwiftUI

struct LegView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("LightRed")
                    .ignoresSafeArea()
                VStack {
                    GifImage("LegExtension")
                        .frame(width: 250, height: 250)
                    GifImage("LegCurl")
                        .frame(width: 250, height: 250)
                    GifImage("LegPress")
                        .frame(width: 250, height: 250)
                }
            }
            .navigationBarHidden(true)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
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
        }
    }
}

struct LegView_Previews: PreviewProvider {
    static var previews: some View {
        LegView()
    }
}
