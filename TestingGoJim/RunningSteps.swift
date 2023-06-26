//
//  RunningSteps.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/26/23.
//

import SwiftUI
import CoreMotion

struct RunningSteps: View {
    private let pedometer: CMPedometer = CMPedometer()
    
    @State private var steps: Int?
    @State private var distance: Double?
    
    private var isPedometerAvailable: Bool {
        return CMPedometer.isPedometerEventTrackingAvailable() && CMPedometer.isDistanceAvailable() && CMPedometer.isStepCountingAvailable()
    }
    
    private func updateUI(data: CMPedometerData) {
        
        steps = data.numberOfSteps.intValue
        
        guard let pedometerDistance = data.distance else { return }
        
        let distanceInMiles = Measurement(value: pedometerDistance.doubleValue, unit: UnitLength.meters)
        
        distance = distanceInMiles.converted(to: .miles).value
        
    }
    private func initializePedometer() {
        if isPedometerAvailable {
            guard let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date()) else {
                return
            }
            
            pedometer.queryPedometerData(from: startDate, to: Date()) {
                (data, error) in
                guard let data = data, error == nil else { return }
                
                
                steps = data.numberOfSteps.intValue
                distance = data.distance?.doubleValue
                
            }
        }
    }
    var body: some View {
        VStack {
            Text("Today's Running Statistics")
                .font(.system(size: 25))
            Text(steps != nil ? "\(steps!) Steps" : "").padding() .font(.system(size: 25))
            Text(distance != nil ? "\(distance!) Miles" : "").padding() .font(.system(size: 25))
                .onAppear {
                    initializePedometer()
                }
        }
    }
}

struct RunningSteps_Previews: PreviewProvider {
    static var previews: some View {
        RunningSteps()
    }
}
