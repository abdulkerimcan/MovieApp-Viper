//
//  MovieService.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 16.11.2024.
//

import Foundation

enum ServiceError: Error {
    case invalidResponse
    case invalidData
}

final class MovieService {
    static let shared = MovieService()
    
    private let session = URLSession.shared
    private let headers = ApiConstants.shared.headers
    
    private init() {}
    
    
    func fetchMovies(completion: @escaping (Result<MovieListResponse, Error>) -> () ) {
        guard let url = ApiConstants.shared.popularMovies else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(ServiceError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(ServiceError.invalidData))
                return
            }
            do {
                let movies = try JSONDecoder().decode(MovieListResponse.self, from: data)
                completion(.success(movies))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
