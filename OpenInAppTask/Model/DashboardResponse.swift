//
//  ApiResponse.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//
import Foundation


struct DashboardResponse: Codable{
   
    let data: DashboardData
    
}

struct DashboardData: Codable {
    let recentLinks: [LinkModel]
    let topLinks: [LinkModel]
    let favouriteLinks: [LinkModel]
    let overallUrlChart: [String:Int]
}

