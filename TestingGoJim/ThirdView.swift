import SwiftUI
import Foundation

struct ThirdView: View {
    @State private var quote: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color("LightRed")
                    .ignoresSafeArea()
                VStack {
                    Text(quote)
                        .foregroundColor(.white)
                    Button {
                        Task {
                            let (data, _) = try await URLSession.shared.data(from: URL(string:"https://type.fit/api/quotes")!)
                            let decodedResponse = try? JSONDecoder().decode(InspirationQuote.self, from: data)
                            quote = decodedResponse?.value ?? ""
                        }
                    } label: {
                        Text("Generate New Quote")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(.black)
                            .cornerRadius(15)
                            .padding()
                    }
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
struct InspirationQuote: Codable {
    let value: String
}
    struct ThirdView_Previews: PreviewProvider {
        static var previews: some View {
            ThirdView()
        }
    }
    
