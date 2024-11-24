//
//  MovieRequest.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 16.11.2024.
//


import Foundation

struct MovieRequest: Codable {
    let media_type: String?
    let media_id: Int?
    let watchlist: Bool?
}
