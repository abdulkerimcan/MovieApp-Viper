//
//  HomeViewInteractor.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 16.11.2024.
//

import Combine
import Foundation

final class HomeViewInteractor: HomeViewInteractorProtocol {
    private var service: MovieService
    
    init (service: MovieService) {
        self.service = service
    }
    
    func load() -> AnyPublisher<MovieListResponse, Error> {
        return service.fetchMovies().eraseToAnyPublisher()
            
    }
    func selectMovie(index: Int) {
        
    }
}
