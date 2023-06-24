//
//  CreateNewLogView.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/24/23.
//

import SwiftUI

struct CreateNewLogView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activityVM : ActivityLogViewModel
    
    @State var name: String = ""
    @State var type : TypeOfActivity = .dietary
    @State var date = Date()
    var body: some View {
        NavigationView {
            ZStack {
                Color("LightRed")
                    .ignoresSafeArea()
                Form {
                    Section {
                        TextField("Name of Activity", text: $name)
                    }
                    Section {
                        Picker("Type of Activity", selection: $type) {
                            ForEach(TypeOfActivity.allCases) { type in
                                Label(
                                    title: { Text(type.title) },
                                    icon: { Image(systemName: "person.fill")})
                                .foregroundColor(type.color)
                                .tag(type)
                            }
                        }
                    }
                    DisclosureGroup("Date") {
                        DatePicker("", selection: $date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                    }
                    
                }
            }
            .padding([.bottom], 20)
            .navigationTitle("\("Create An Activity")")
            
        }.navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action:{
                                presentationMode.wrappedValue.dismiss() },
                                label : {
                                    Text("Cancel")
                                    .foregroundColor(.red)
                                }),
                trailing: Button(action:{activityVM.addActivity(activity: .init(name: name, date: date, type: type))
                    presentationMode.wrappedValue.dismiss()},
                                 label:{
                                     Text("Save")
                                 }))
    }
}
            
struct CreateNewLogView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewLogView(activityVM: ActivityLogViewModel())
    }
}
