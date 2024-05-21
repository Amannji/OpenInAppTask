//
//  NetworkManager.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import Foundation

final class NetworkManager{
    static let shared = NetworkManager()
    
    private let baseUrl = "https://api.inopenapp.com/api/v1/dashboardNew"
    private let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    private init(){}
    
    func getRecentLinks(completed:@escaping(Result<DashboardData,TaskError>)->Void){
        guard let url = URL(string:baseUrl) else{
            completed(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request){ (data,response,error) in
            if let _ = error{
                completed(.failure(.failedAuthorization))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                completed(.failure(.invalidResponse))
                return
            }
           
            
            do {
               let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedResponse = try decoder.decode(DashboardResponse.self, from: data)
                completed(.success(decodedResponse.data))
                
                
            } catch {
                completed(.failure(.invalidResponse))
            }
            
            
            
        }
        task.resume()
        
        
    }
}

