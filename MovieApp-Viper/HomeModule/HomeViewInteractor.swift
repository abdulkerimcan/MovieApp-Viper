//
//  HomeViewInteractor.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 16.11.2024.
//


final class HomeViewInteractor: HomeViewInteractorProtocol {
    var delegate: (any HomeViewInteractorDelegate)?
    
    private var service: MovieService
    
    init (service: MovieService) {
        self.service = service
    }
    func load() {
        self.delegate?.handleOutput(.setLoading(true))
        service.fetchMovies {[weak self] result in
            guard let self else { return }
            self.delegate?.handleOutput(.setLoading(false))
            switch result {
            case .success(let success):
                self.delegate?.handleOutput(.showMovieList(success.results))
                break
            case .failure(let failure):
                self.delegate?.handleOutput(.showError(failure.localizedDescription))
            }
        }
    }
    
    func selectMovie(index: Int) {
        
    }
}
