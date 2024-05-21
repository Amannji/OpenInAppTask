//
//  TaskError.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 20/05/24.
//

import Foundation


enum TaskError: Error{
    case invalidData
    case invalidResponse
    case invalidUrl
    case failedAuthorization
}
