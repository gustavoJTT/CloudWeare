import Foundation

enum apiKeyGemini{
    static var `default`: String{
        guard let filePath = Bundle.main.path(forResource: "GenerativeAI-Info", ofType: "plist")
        else{
            fatalError("Algo deu errado")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else{
            fatalError("Algo errado")
        }
        if value.starts(with: "_"){
            fatalError("Algo Errado")
        }
        return value
    }
}
