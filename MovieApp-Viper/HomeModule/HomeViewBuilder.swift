//
//  HomeViewBuilder.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 17.11.2024.
//


final class HomeViewBuilder {
    
    static func make() -> HomeViewController {
        let view = HomeViewController()
        let router = HomeRouter(view: view)
        let interactor = HomeViewInteractor(service: .shared)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}