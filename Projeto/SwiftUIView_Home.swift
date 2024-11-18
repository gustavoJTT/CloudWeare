import SwiftUI
import GoogleGenerativeAI


struct Clima: Hashable, Decodable {
    var cidade: String?
    var temperatura_atual: Double?
    var temperatura_maxima: Double?
    var temperatura_minima: Double?
    var umidade: Int?
}


struct SwiftUIView_Home: View {
    let model = GenerativeModel(name: "gemini-pro", apiKey: "AIzaSyC4EQBF1rKJHTLC864kRhYNdTnch2nnHGI")
    @State var textInput = ""
    @State var aiResponse = ""
    @State var camisa = "camisa"
    
    
    
    
    
    @State var nome_Home: String = ""
    
    @StateObject var vm = ViewModel()
    
    @State var aiResponse2 = "Teste"
    @State var aiResponse3 = "Teste"
    
    @State private var weather: WeatherResponse?
    @State private var city = "Natal"  // Cidade fixa
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    func CarregarDados() -> [Clima] {
        guard let url = Bundle.main.url(forResource: "weather_data", withExtension: "json") else {
            print("Arquivo JSON não encontrado.")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let dadosDecodificados = try decoder.decode([Clima].self, from: data)
            return dadosDecodificados
        } catch {
            print("Erro ao carregar ou decodificar o arquivo JSON: \(error)")
            return []
        }
    }
    
    
    var body: some View {
        ZStack{
            Color(.C_BG)
                .ignoresSafeArea(.all)
            ZStack{
                VStack{
                    
                    Image(.component1) // LOGO
                    Spacer()
                    HStack{
                        HStack{ // DIV CARDS
                            ZStack{ // CARDS
                                Rectangle() // RETANGULO
                                    .fill(.mainAzul)
                                    .frame(width: 178, height: 164).cornerRadius(14)
                                Rectangle() // RETANGULO
                                    .fill(.backgroundCard)
                                    .frame(width: 175, height: 160).cornerRadius(14)
                                
                                VStack{
                                    if isLoading {
                                        ProgressView()
                                    } else if let weather = weather {
                                        var sitacao_Climatica = weather.weather.first?.description.capitalized
                                        if (sitacao_Climatica == "Céu Limpo"){
                                            Image(.imagemSolENSOLARADO).resizable().frame(width: 60, height: 60)
                                            Text(sitacao_Climatica!).font(.title2).bold()
                                        }
                                        else if (sitacao_Climatica == "Poucas Nuvens"){
                                            Image(.imagemSolENSOLARADO).resizable().frame(width: 60, height: 60)
                                            Text(sitacao_Climatica!).font(.title2).bold()
                                        }
                                        else if (sitacao_Climatica == "Nuvens Dispersas"){
                                            Image(.imagemSolENSOLARADO).resizable().frame(width: 60, height: 60)
                                            Text(sitacao_Climatica!).font(.title2).bold()
                                        }
                                        else if (sitacao_Climatica == "Nuvens Quebradas"){
                                            Image(.imagemSolENSOLARADO).resizable().frame(width: 60, height: 60)
                                            Text(sitacao_Climatica!).font(.title2).bold()
                                        }
                                        else if (sitacao_Climatica == "Nuvens Cobertas"){
                                            Image(.imagemNuvemCHUVOSO).resizable().frame(width: 80, height: 80)
                                            Text(sitacao_Climatica!).font(.title2).bold()
                                        }
                                        else if (sitacao_Climatica == "Chuva Rápida"){
                                            Image(.imagemNuvemCHUVOSO).resizable().frame(width: 80, height: 80)
                                            Text(sitacao_Climatica!).font(.title2).bold()
                                        }
                                        else if (sitacao_Climatica == "Chuva Constante"){
                                            Image(.imagemNuvemCHUVOSO).resizable().frame(width: 80, height: 80)
                                            Text(sitacao_Climatica!).font(.title2).bold()
                                        }
                                        else if (sitacao_Climatica == "Tempestade"){
                                            Image(.imagemNuvemCHUVOSO).resizable().frame(width: 80, height: 80)
                                            Text(sitacao_Climatica!).font(.title2).bold()
                                        }
                                    } else if let errorMessage = errorMessage {
                                        Text("Erro: \(errorMessage)")
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                }
                                
                            }
                        }
                        Spacer()
                        ZStack{
                            Rectangle() // RETANGULO
                                .fill(.mainAzul)
                                .frame(width: 178, height: 164).cornerRadius(14)
                            Rectangle()
                                .fill(.backgroundCard)
                                .frame(width: 175, height: 160).cornerRadius(14)
                            HStack{
                                Image(.imagemTermometro)
                                VStack {
                                    if isLoading {
                                        ProgressView()
                                    } else if let weather = weather {
                                        VStack{
                                            
                                            Text("\(String(format: "%.1f", weather.main.temp))°C").font(.title).bold()
                                            Text("umidade:\(weather.main.humidity)%")
                                        } .offset(x:-9, y:0)
                                    } else if let errorMessage = errorMessage {
                                        Text("Erro: \(errorMessage)")
                                            .foregroundColor(.red)
                                            .padding()
                                    }
                                }
                                .onAppear {
                                    fetchWeather()
                                }
                            }
                        }
                    }
                    
                    ScrollView{
                        Text(aiResponse.replacingOccurrences(of: "**", with: ""))
                            .frame(width: 300, height: 500)
                    }
                    
                    Button{
                        sendImage()
                    }label: {
                        Text("Pesquisar").fontWeight(.bold)
                            .frame(width: 105, height: 53)
                            .background(Color("mainAzul"))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                }.padding()
                Spacer()
            }.onAppear(){vm.fetch()}
        }
    }
    func fetchWeather() {
            isLoading = true
            errorMessage = nil
            
            // Chama a API com a cidade fixa "Natal"
            WeatherService.shared.fetchWeather(for: city) { result in
                DispatchQueue.main.async {
                    isLoading = false
                    switch result {
                    case .success(let weatherResponse):
                        self.weather = weatherResponse
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        
        }

func sendImage(){
    if let weather = weather {
        for roupa in vm.roupas {
                aiResponse3 += roupa.tipo!
                
                //            print(roupa.tipo ?? "x")
                
            }
            aiResponse2 = "De acordo com a temperatura de \(weather.main.temp), diga a melhor combinação de roupa posso fazer com as seguintes roupas: \(aiResponse3)"
            //  textInput = "teste \(camisa)"
            print(aiResponse3)
            //   aiResponse = ""
            Task {
                do {
                    let response = try await model.generateContent(aiResponse2)
                    
                    guard let text = response.text else{
                        textInput = "Algo deu errado"
                        return
                    }
                    
                    textInput = ""
                    aiResponse = text
                    
                }catch{
                    aiResponse = "\(error.localizedDescription)"
                }
            }
    }
    //  var vm = ViewModel()
    
}

}

#Preview {
    SwiftUIView_Home()
}
