//
//  ActivityLogView.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/24/23.
//

import SwiftUI

struct ActivityLogView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("LightRed")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text("Log Your Workouts")
                        .font(.system(size: 30))
                    NavigationLink(destination: CreateNewLogView(activityVM: ActivityLogViewModel())) {
                        Text("Create a New Log")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(.black)
                            .cornerRadius(15)
                            .padding()
                    }
                    NavigationLink(destination: ThirdView().navigationBarBackButtonHidden(false)) {
                        Text("Delete a Log")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(.black)
                            .cornerRadius(15)
                            .padding()
                    }
                    Spacer()
                }
                HStack(spacing: 50) {
                    NavigationLink(destination: SecondView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "house")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                    NavigationLink(destination: SecondView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "message.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                    NavigationLink(destination: SecondView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "newspaper.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                    NavigationLink(destination: SecondView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "figure.strengthtraining.traditional")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                    NavigationLink(destination: SecondView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "map.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                }
                .position(x: 200, y: 840)
            }
        }
    }
}

struct ActivityLogView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLogView()
    }
}
