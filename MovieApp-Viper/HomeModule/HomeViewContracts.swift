//
//  Untitled.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 12.11.2024.
//


import UIKit

//View


protocol HomeViewProtocol: AnyObject {
    func handleOutput(_ output: HomeViewPresenterOutput)
}


// Presenter

protocol HomePresenterProtocol: AnyObject {
    func load()
    func selectMovie(index: Int)
}

enum HomeViewPresenterOutput {
    case showMovieList([MovieResult])
    case setLoading(Bool)
    case showError(String)
}

// Interactor

protocol HomeViewInteractorProtocol: AnyObject {
    var delegate: HomeViewInteractorDelegate? { get set }
    func load()
    func selectMovie(index: Int)
}

enum HomeViewInteractorOutput {
    case showMovieList([MovieResult])
    case setLoading(Bool)
    case showError(String)
}

protocol HomeViewInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeViewInteractorOutput)
}

// Router

enum HomeRouteTo {
    case movieDetail(String)
}

protocol HomeViewRouterProtocol: AnyObject {
    func navigateToMovieDetail(to route: HomeRouteTo)
}
