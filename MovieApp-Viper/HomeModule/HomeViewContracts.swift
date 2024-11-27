//
//  Untitled.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 12.11.2024.
//


import UIKit
import Combine

//View


protocol HomeViewProtocol: AnyObject {
    func handleOutput(_ output: HomeViewPresenterOutput)
}


// Presenter

protocol HomePresenterProtocol: AnyObject {
    func load()
    func moviesCount() -> Int
    func movieFor(index: Int) -> MovieResult?
    func selectMovie(index: Int)
}

enum HomeViewPresenterOutput {
    case showMovieList([MovieResult])
    case setLoading(Bool)
    case showError(String)
}

// Interactor

protocol HomeViewInteractorProtocol: AnyObject {
    func load() -> AnyPublisher<MovieListResponse, Error>
    func selectMovie(index: Int)
}

// Router

enum HomeRouteTo {
    case movieDetail(String)
}

protocol HomeViewRouterProtocol: AnyObject {
    func navigateToMovieDetail(to route: HomeRouteTo)
}
