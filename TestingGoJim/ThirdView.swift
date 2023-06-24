import SwiftUI

struct ThirdView: View {
    @State private var quote: String = ""
    @State private var tips: [Tips] = []
    @State private var selectedTip: Tips?
    
    var healthTip: Tips {
        selectedTip ?? Tips(tip: "")
    }
    
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
                        Text("Inspirational Quote")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(Color.black)
                            .cornerRadius(15)
                            .padding(.top, -20)
                    }
                }
                .position(x: 210, y: 80)
                .onAppear {
                    fetchData()
                    selectRandomTip()
                }
                
                Image("logo")
                    .resizable()
                    .frame(width: 400, height: 100)
                    .position(x: 200, y: 400)
                
                VStack {
                    Text("Tips for Beginners")
                        .frame(width: 150, height: 40)
                        .background(Color.white)
                        .cornerRadius(15)
                    
                    Text(healthTip.tip)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.black)
                        .cornerRadius(15)
                }
                .position(x: 200, y: 700)
                
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
    
    func selectRandomTip() {
        if tips.isEmpty {
            let tipsURL = Bundle.main.url(forResource: "healthtips", withExtension: "json")!
            if let tipsData = try? Data(contentsOf: tipsURL) {
                let decoder = JSONDecoder()
                do {
                    let decodedTips = try decoder.decode([Tips].self, from: tipsData)
                    DispatchQueue.main.async {
                        self.tips = decodedTips
                        self.selectedTip = decodedTips.randomElement()
                    }
                } catch {
                    print("Error decoding health tips JSON: \(error)")
                }
            }
        } else {
            self.selectedTip = tips.randomElement()
        }
    }
}

struct InspirationQuote: Codable {
    let text: String
}

struct Tips: Codable {
    let tip: String
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}



    
