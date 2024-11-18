import Foundation

// Estruturas para mapear os dados JSON da API
struct WeatherData: Codable {
    let main: Main
    let name: String
}

struct Main: Codable {
    let temp: Double
    let temp_max: Double
    let temp_min: Double
    let humidity: Int
}

func getWeatherData(completion: @escaping (WeatherData?) -> Void) {
    let apiKey = "969648e39721f18473800760fa56155a"
    let city = "Natal,BR"
    let urlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)"
    
    guard let url = URL(string: urlString) else {
        print("URL inválida")
        completion(nil)
        return
    }
    
    // Faz a requisição para a API
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Erro na requisição: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        // Verifica se os dados foram recebidos corretamente
        guard let data = data else {
            print("Dados não recebidos")
            completion(nil)
            return
        }
        
        // Tenta fazer o parsing dos dados para o modelo
        do {
            let decoder = JSONDecoder()
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            completion(weatherData)
        } catch {
            print("Erro ao decodificar os dados: \(error)")
            completion(nil)
        }
    }
    
    task.resume()
}

// Função para salvar os dados em um arquivo JSON
func saveWeatherDataToFile(weatherData: WeatherData) {
    let fileManager = FileManager.default
    let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsDirectory.appendingPathComponent("weather_data.json")
    
    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(weatherData)
        try data.write(to: fileURL)
        print("Dados salvos com sucesso no arquivo \(fileURL.path)")
    } catch {
        print("Erro ao salvar o arquivo: \(error)")
    }
}

// Chama a função para buscar os dados e salvar em arquivo
getWeatherData { weatherData in
    if let weatherData = weatherData {
        print("Temperatura atual: \(weatherData.main.temp)°C")
        print("Temperatura máxima: \(weatherData.main.temp_max)°C")
        print("Temperatura mínima: \(weatherData.main.temp_min)°C")
        print("Umidade: \(weatherData.main.humidity)%")
        
        // Salva os dados no arquivo JSON
        saveWeatherDataToFile(weatherData: weatherData)
    } else {
        print("Não foi possível obter os dados climáticos.")
    }
}

// Aguarda a execução assíncrona
RunLoop.main.run()
