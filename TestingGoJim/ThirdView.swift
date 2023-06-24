import SwiftUI

struct ThirdView: View {
    @State private var quote: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("LightRed")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text(quote)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .frame(width: 350, height: 100)
                        .background(Color.white)
                        .cornerRadius(30)
                        .padding()
                        .padding()
                    Button {
                        fetchData()
                    } label: {
                        Text("Generate New Quote")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(Color.black)
                            .cornerRadius(15)
                            .padding(.top, -20)
                    }
                }.position(x: 200, y: 80)
                
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
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://type.fit/api/quotes") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([InspirationQuote].self, from: data)
                    if let randomQuote = decodedResponse.randomElement() {
                        DispatchQueue.main.async {
                            self.quote = randomQuote.text
                        }
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        
        task.resume()
    }
}

struct InspirationQuote: Codable {
    let text: String
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}


    
