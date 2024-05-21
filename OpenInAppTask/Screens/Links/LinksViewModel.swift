//
//  LinksViewModel.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import Foundation

class LinksViewModel: ObservableObject{
    @Published var recentLinks: [LinkModel] = []
    @Published var topLinks:[LinkModel] = []
    @Published var chartData:[String:Int] = [:]
    
    
    
    func getRecentLinks(){
        NetworkManager.shared.getRecentLinks{[self] result in
            DispatchQueue.main.async{
                switch result{
                case .success(let data):
                    self.recentLinks = data.recentLinks
                    self.topLinks = data.topLinks
                    self.chartData = data.overallUrlChart
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
    
    
}
