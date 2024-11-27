//
//  MovieService.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 16.11.2024.
//

import Foundation
import Combine

enum ServiceError: Error {
    case invalidResponse
    case invalidData
    case invalidURL
}

final class MovieService {
    static let shared = MovieService()
    
    private let session = URLSession.shared
    private let headers = ApiConstants.shared.headers
    
    private init() {}
    
    func fetchMovies() -> AnyPublisher<MovieListResponse, Error> {
        guard let url = ApiConstants.shared.popularMovies else { return  Fail(error: ServiceError.invalidURL).eraseToAnyPublisher()}
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        return session.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: MovieListResponse.self, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case is URLError:
                    return error
                case is DecodingError:
                    return error
                default:
                    return ServiceError.invalidResponse
                }
            }
            .eraseToAnyPublisher()
    }
}
