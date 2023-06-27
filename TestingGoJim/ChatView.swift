//
//  ChatView.swift
//  TestingGoJim
//
//  Created by Jackie Cheng on 6/25/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Color("LightRed")
                VStack {
                    ScrollView {
                        ForEach(viewModel.messages.filter({$0.role != .system}),
                                id: \.id) { message in messageView(message: message)
                        }.position(x: 200, y: 130)
                    }
                    HStack {
                        TextField("Enter a message...", text:
                                    $viewModel.currentInput)
                        
                        Button {
                            viewModel.sendMessage()
                        } label: {
                            Text("Send")
                        }
                    }.position(x: 200, y: 520)
                    HStack(spacing: 50) {
                        NavigationLink(destination: ThirdView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "house")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25)
                        }
                        NavigationLink(destination: ChatView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "message.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25)
                        }
                        
                        NavigationLink(destination: CalculatorView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "figure.strengthtraining.traditional")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25)
                        }
                        NavigationLink(destination: RunningMapView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "map.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25)
                        }
                        NavigationLink(destination: GalleryView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25)
                        }
                    }
                    .position(x: 200, y: 270)
                }.padding()
            }.ignoresSafeArea()
        }
    }
}
func messageView(message: Message) -> some View {
    HStack {
        if message.role == .user { Spacer()}
        Text(message.content)
            .padding()
            .background(message.role == .user ? Color.gray : Color.black)
            .foregroundColor(message.role == .user ? Color.black : Color.white)
        if message.role == .assistant { Spacer()}
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
