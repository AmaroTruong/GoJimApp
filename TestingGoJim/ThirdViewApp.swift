//
//  ThirdViewApp.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/23/23.
//

import SwiftUI
import FirebaseCore

struct ThirdViewApp: App {

    init() {
        FirebaseApp.configure()
    }

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ThirdView()
      }
    }
  }
}
