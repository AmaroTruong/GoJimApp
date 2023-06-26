import SwiftUI
import MapKit
import CoreLocation

struct RunningMapView: View {
    @State private var tracking: MapUserTrackingMode = .follow
    @ObservedObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 39.955592,
            longitude: -75.189945
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.02,
            longitudeDelta: 0.02
        )
    )
    @State private var startLocation: CLLocation?
    @State private var totalDistance: CLLocationDistance = 0.0
    @State private var isRunning = false
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack(spacing: 0.0) {
                    ZStack {
                        Map(
                            coordinateRegion: $region,
                            interactionModes: MapInteractionModes.all,
                            showsUserLocation: true,
                            userTrackingMode: $tracking
                        )
                        .ignoresSafeArea()
                    }
                    .frame(height: proxy.size.height / 2)
                    
                    ZStack {
                        Color("LightRed")
                        
                        HStack {
                            Stopwatch()
                                .position(x: 210, y: 270)
                                .environmentObject(StopwatchViewModel(
                                    isRunning: $isRunning,
                                    onReset: resetDistance
                                ))
                        }
                        .frame(height: proxy.size.height / 2)
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
                        }
                        .position(x: 200, y: 430)
                        
                        Text("Total Distance: \(totalDistance) meters")
                            .foregroundColor(.white)
                            .position(x: 185, y: 100)
                            .font(.system(size: 40))
                            .padding()
                    }
                    
                }
            }
            .onAppear {
                locationManager.manager.startUpdatingLocation()
            }
            .ignoresSafeArea()
        }
    }
    
    private func handleLocationUpdate(_ locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        
        if isRunning {
            if startLocation == nil {
                startLocation = currentLocation
            } else {
                let distance = currentLocation.distance(from: startLocation!)
                totalDistance += distance
                startLocation = currentLocation
            }
        }
    }
    
    private func resetDistance() {
        startLocation = nil
        totalDistance = 0.0
    }
}

struct RunningMapView_Previews: PreviewProvider {
    static var previews: some View {
        RunningMapView()
    }
}

