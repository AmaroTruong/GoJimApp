import SwiftUI
import MapKit

struct RunningMapView: View {
    
    @State private var tracking: MapUserTrackingMode = .follow
    @StateObject private var manager = LocationManager()
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.789467,
            longitude: -122.416772
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5
        )
    )
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0.0) {
                ZStack {
                    Map(
                        coordinateRegion: $manager.region,
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
                            .position(x: 210, y: 350)
                    }
                    .frame(height: proxy.size.height / 2)
                }
            }
        }.ignoresSafeArea()
    }
}

    
struct RunningMapView_Previews: PreviewProvider {
    static var previews: some View {
        RunningMapView()
    }
}
