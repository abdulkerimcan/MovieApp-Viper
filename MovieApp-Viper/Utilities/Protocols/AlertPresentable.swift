//
//  AlertPresentable.swift
//  MovieApp-Viper
//
//  Created by Abdulkerim Can on 16.11.2024.
//


import UIKit

protocol AlertPresentable where Self: UIViewController {
    func showAlert(title: String, message: String, okAction: @escaping () -> Void)
}

extension AlertPresentable where Self: UIViewController {
    func showAlert(title: String, message: String, okAction: @escaping () -> Void) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default) { _ in
                okAction()
            }
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
}
