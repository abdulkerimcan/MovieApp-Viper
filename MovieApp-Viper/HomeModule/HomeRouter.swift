//
//  HomeRouter.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 16.11.2024.
//

import UIKit

final class HomeRouter: HomeViewRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigateToMovieDetail(to route: HomeRouteTo) {
        switch route {
        case .movieDetail(let string):
//            MovieListBuilder
            break
        }
    }
    
}


