//
//  RunningMapView.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/25/23.
//
import SwiftUI
import MapKit

struct RunningMapView: View {
    @State var tracking:MapUserTrackingMode = .follow
    @StateObject var manager = LocationManager()
    @State var region = MKCoordinateRegion(
        center:  CLLocationCoordinate2D(
          latitude: 37.789467,
          longitude:-122.416772
        ),
        span: MKCoordinateSpan(
          latitudeDelta: 0.5,
          longitudeDelta: 0.5
       )
    )

    var body: some View {
        Map(
           coordinateRegion: $manager.region,
           interactionModes: MapInteractionModes.all,
           showsUserLocation: true,
           userTrackingMode: $tracking
        ).ignoresSafeArea()
            }
        }
struct RunningMapView_Previews: PreviewProvider {
    static var previews: some View {
        RunningMapView()
    }
}
