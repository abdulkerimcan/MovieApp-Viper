//
//  HomePresenter.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 16.11.2024.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {
    private unowned let view: HomeViewProtocol
    private let interactor: HomeViewInteractor
    private let router: HomeViewRouterProtocol
    
    
    init(view: HomeViewProtocol, interactor: HomeViewInteractor, router: HomeViewRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    func load() {
        interactor.load()
    }
    
    func selectMovie(index: Int) {
        
    }
    
}

extension HomePresenter: HomeViewInteractorDelegate {
    func handleOutput(_ output: HomeViewInteractorOutput) {
        switch output {
        case .showMovieList(let array):
            self.view.handleOutput(.showMovieList(array))
        case .setLoading(let bool):
            self.view.handleOutput(.setLoading(bool))
        case .showError(let string):
            self.view.handleOutput(.showError(string))
        }
    }
}
