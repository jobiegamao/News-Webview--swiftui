//
//  NetworkManager.swift
//  News-swiftui
//
//  Created by Squadzip on 10/3/23.
//

import Foundation

struct API {
    let base_url = "http://hn.algolia.com/api/v1/"
    let front_page = "search?tags=front_page"
}

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        // 1. URL
        guard let url = URL(string: API().base_url + API().front_page)  else { return }
        // 2. Create Session
        let session = URLSession(configuration: .default)
        // 3. Add task to session
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard error == nil,
                  let data = data
            else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            // 4. Json Decoder
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(Result.self, from: data)
                DispatchQueue.main.async {
                    self?.posts = results.hits
                }
            } catch  {
                print(error)
            }
            
        }
        // 5. Start task
        task.resume()
        
    }
}
