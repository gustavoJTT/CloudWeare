import Foundation


struct Roupas: Codable, Hashable{
    let tipo: String?
    let nome: String?
    let cor: String?
}

class ViewModel : ObservableObject {
    @Published var roupas : [Roupas] = []
    
    func fetch()
    {
        let task = URLSession.shared.dataTask(with: URL(string:"http://192.168.128.77:1880/getRoupas")!){ data, _, error in
            do {
                self.roupas = try JSONDecoder().decode([Roupas].self, from: data!)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    func post(_ obj: Roupas){
        
        guard let url = URL(string: "http://192.168.128.77:1880/postRoupas") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(obj)
            request.httpBody = jsonData
            print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error to send resource: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error to send resource: invalid response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource POST successfully")
            } else {
                print("Error POST resource: status code \(httpResponse.statusCode)")
            }
        }
        task.resume()
    }
}
