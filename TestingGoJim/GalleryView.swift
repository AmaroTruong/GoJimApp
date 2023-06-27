//
//  GalleryView.swift
//  TestingGoJim
//
//  Created by Amaro Truong on 6/26/23.
//
import SwiftUI

struct GalleryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("LightRed")
                    .ignoresSafeArea()
                
                VStack {
                    NavigationLink(destination: ChestView().navigationBarBackButtonHidden(true)) {
                        Text("Chest")
                            .foregroundColor(.white)
                            .frame(width: 400, height: 100)
                            .background(.black)
                            .cornerRadius(15)
                            .padding()
                    }
                    
                    NavigationLink(destination: BackView().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .foregroundColor(.white)
                            .frame(width: 400, height: 100)
                            .background(.black)
                            .cornerRadius(15)
                            .padding()

                    }
                    NavigationLink(destination: ShoulderView().navigationBarBackButtonHidden(true)) {
                        Text("Shoulders")
                            .foregroundColor(.white)
                            .frame(width: 400, height: 100)
                            .background(.black)
                            .cornerRadius(15)
                            .padding()

                    }
                    NavigationLink(destination: ArmsView().navigationBarBackButtonHidden(true)) {
                        Text("Arms")
                            .foregroundColor(.white)
                            .frame(width: 400, height: 100)
                            .background(.black)
                            .cornerRadius(15)
                            .padding()

                    }
                    NavigationLink(destination: LegView().navigationBarBackButtonHidden(true)) {
                        Text("Legs")
                            .foregroundColor(.white)
                            .frame(width: 400, height: 100)
                            .background(.black)
                            .cornerRadius(15)
                            .padding()

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
        }
    }
    
    struct GalleryView_Previews: PreviewProvider {
        static var previews: some View {
            GalleryView()
        }
    }
}
