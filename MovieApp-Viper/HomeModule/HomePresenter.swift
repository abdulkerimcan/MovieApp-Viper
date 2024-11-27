//
//  HomePresenter.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 16.11.2024.
//

import Foundation
import Combine

final class HomePresenter: HomePresenterProtocol {
    
    private unowned let view: HomeViewProtocol
    private let interactor: HomeViewInteractor
    private let router: HomeViewRouterProtocol
    private var movies: [MovieResult] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(view: HomeViewProtocol, interactor: HomeViewInteractor, router: HomeViewRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func load() {
        view.handleOutput(.setLoading(true))
        interactor.load()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                self.view.handleOutput(.setLoading(false))
                switch completion {
                case .failure(let error):
                    self.view.handleOutput(.showError(error.localizedDescription))
                case .finished:
                    break
                }
            } receiveValue: { [weak self] movies in
                guard let self else { return }
                self.movies = movies.results
                self.view.handleOutput(.showMovieList(movies.results))
            }
            .store(in: &cancellables)
    }
    
    func selectMovie(index: Int) {
        
    }
    
    func moviesCount() -> Int {
        movies.count
    }
    
    func movieFor(index: Int) -> MovieResult? {
        movies[index]
    }
    
}
