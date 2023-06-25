//
//  StopwatchViewModel.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/25/23.
//
import SwiftUI

class StopwatchViewModel: ObservableObject {
    @Binding var isRunning: Bool
    var onReset: () -> Void
    
    init(isRunning: Binding<Bool>, onReset: @escaping () -> Void) {
        self._isRunning = isRunning
        self.onReset = onReset
    }
}
