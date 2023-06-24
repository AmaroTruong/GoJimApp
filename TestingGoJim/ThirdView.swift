import SwiftUI

struct ThirdView: View {
    @State private var quote: String = ""
    let tips = Bundle.main.decode([Tips].self, from: "healthtips.json")
    
    var healthTip : Tips { tips.randomElement()! }
    
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
                }.position(x: 210, y: 80)
                
                VStack {
                    Text("Tips for Beginners")
                        .frame(width: 150, height: 40)
                        .background(Color.white)
                        .cornerRadius(15)
                    Text(healthTip.text)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.black)
                        .cornerRadius(15)
                }.position(x: 200, y: 700)
                
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

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}

struct Tips: Codable {
    let text: String
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}


    
