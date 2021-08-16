//
//  SearchGame.swift
//  GameStream
//
//  Created by Enrique Ramos on 14/8/21.
//

import Foundation

class SearchGame: ObservableObject {
    
    @Published var gameInfo = [Game]()
    
    
    func search(gameName: String) {
        
        
        gameInfo.removeAll()
        
        //Esta opcion nos permite poner espacios en la url donde se envirara el parametro en la URL
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) { data, reponse, error in
            
            do{
                
                if let jsonData = data{
                    
                    print("tamaño del Json \(jsonData)")
                    
                    let decodeData = try
                        JSONDecoder().decode(Resultados.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        
                        self.gameInfo.append(contentsOf: decodeData.results)
                        
                    }
                    
                }
                
                
            } catch{
                
                print("Error: \(error)")
                
            }
            
        }.resume()
        
        
    }
    
}
