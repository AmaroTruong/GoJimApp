//
//  Test.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/26/23.
//

import SwiftUI

struct Test: View {
    var body: some View {
        MapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
