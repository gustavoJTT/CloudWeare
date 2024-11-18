import Foundation

class WeatherService {
    static let shared = WeatherService()
    
    private let apiKey = "0afee6791ec24e549e57843d40e4c9db" // Substitua pela sua chave de API do OpenWeatherMap
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(for city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)?q=\(city)&appid=\(apiKey)&units=metric&lang=pt_br") else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
