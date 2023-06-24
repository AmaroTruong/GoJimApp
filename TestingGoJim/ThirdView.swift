//
//  ThirdView.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/23/23.

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

struct ThirdView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView {
                    ZStack {
                        VStack {
                            HStack {
                                Text("Already Have An Account?")
                            }
                            HStack {
                                Image(systemName: "person")
                                TextField("Username", text: $username)
                            }.frame(width: 400, height: 10)
                            HStack {
                                SecureField("Password", text: $password)
                            }.frame(width: 345, height: 10)
                            NavigationLink {
                                WelcomePage()
                            } label: {
                                Text("Login")
                                    .foregroundColor(.white)
                                    .frame(width: 200, height: 40)
                                    .background(.black)
                                    .cornerRadius(15)
                                    .padding()
                            }
                            Text("Join us!")
                                .position(x: 215, y: 600)
                            NavigationLink {
                                CreateAccountPage()
                            } label: {
                                Text("Login")
                                    .foregroundColor(.white)
                                    .frame(width: 200, height: 40)
                                    .background(.black)
                                    .cornerRadius(15)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

struct YourApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ThirdView()
      }
    }
  }
}
