import Foundation

struct WeatherResponse: Codable {
    let main: MainWeather
    let weather: [Weather]
    let name: String
}

struct MainWeather: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let description: String
    let icon: String
}
