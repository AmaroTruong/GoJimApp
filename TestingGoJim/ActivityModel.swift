//
//  File.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/24/23.
//

import Foundation
import SwiftUI

struct Activity : Identifiable , Equatable {
    
    var id : String = UUID().uuidString
    let name : String
    let date : Date
    let type : TypeOfActivity
    
}

enum TypeOfActivity : Int , Identifiable , CaseIterable {
    
    var id : Int { rawValue }
    
    case dietary
    case physical
    case mental
    
    var title : String {
        
        switch self {
        case .dietary :
            return "Dietary"
        case .physical :
            return "Physical"
        case .mental :
            return "Mental"
        }
        
    }
    
    var color : Color {
        
        switch self {
        case .dietary:
            return .black
        case .physical:
            return .blue
        case .mental :
            return .purple
        }
    }
    
}

enum SortType : String , Identifiable , CaseIterable {
    
    var id : String { rawValue }
    
    case alphabetical
    case date
    case priority
    
}
