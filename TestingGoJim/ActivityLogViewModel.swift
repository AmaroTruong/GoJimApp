//
//  ActivityLogViewModel.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/24/23.
//

import Foundation

class ActivityLogViewModel : Identifiable , ObservableObject {
    
    @Published var activities : [Activity] = [
    ]
    
    @Published var sortType : SortType = .alphabetical
    @Published var isPresented = false
    @Published var searched = ""
    
    func addActivity(activity : Activity){
        activities.append(activity)
    }
    
    func removeActivity(indexAt : IndexSet){
        activities.remove(atOffsets: indexAt)
    }
    
}
