//
//  Location.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/25/23.
//

import Foundation
import SwiftUI

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
