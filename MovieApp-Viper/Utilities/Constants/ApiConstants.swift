//
//  ApiConstants.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 16.11.2024.
//

import Foundation

final class ApiConstants {
    static let shared = ApiConstants()
    lazy var headers = [
        "accept": "application/json",
        "Authorization": "Bearer \(token)"
    ]
    private let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNDIyYTBkZTZhODhmNGVjNDNlMjI2MjcwYzczNmYxNCIsInN1YiI6IjY1ZWRhNjBiNDQ3ZjljMDE4NzYwZTc4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mCAf9XyxSojX-YE6Jxm0q9wfYkrNbGROW_AckwuXkas"
    let baseURL = "https://api.themoviedb.org/3"
    let imageURL = "https://image.tmdb.org/t/p/w500"
    lazy var popularMovies = URL(string: "\(baseURL)/movie/popular")
    private init() {}
}
