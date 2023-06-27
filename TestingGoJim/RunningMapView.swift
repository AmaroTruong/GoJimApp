import SwiftUI
import MapKit
import CoreLocation

struct RunningMapView: View {
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack(spacing: 0.0) {
                    ZStack {
                        Test()
                            .ignoresSafeArea()
                    }
                    .frame(height: proxy.size.height / 2)
                    
                    ZStack {
                        Color("LightRed")
                            .ignoresSafeArea()
                        
                        HStack {
                            Stopwatch()
                                .position(x: 210, y: 270)
                        }
                        .frame(height: proxy.size.height / 2)
                        
                        RunningSteps()
                            .position(x: 200, y: 100)
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
                        }.ignoresSafeArea()
                        .position(x: 200, y: 430)
                    }
                }
            }
        }
    }
}

struct RunningMapView_Previews: PreviewProvider {
    static var previews: some View {
        RunningMapView()
    }
}
