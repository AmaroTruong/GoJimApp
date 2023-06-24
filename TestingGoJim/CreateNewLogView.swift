//
//  CreateNewLogView.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/24/23.
//

import SwiftUI

struct CreateNewLogView: View {
    @State private var name: String = ""
    @State private var type: String = ""
    @State private var desc: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color("LightRed")
                    .ignoresSafeArea()
                Form {
                    Section {
                        TextField("Name of Activity", text: $name)
                        TextField("Type of Activity", text: $type)
                        TextField("Description", text: $desc)
                        Button("Submit")
                    }
                }
                .padding([.bottom], 20)
                .navigationTitle("\("Create An Activity")")
            }
        }
    }
}

struct CreateNewLogView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewLogView()
    }
}
