//
//  ModuleBuilder.swift
//  MVP Try
//
//  Created by Vasily Maslov on 30.11.2024.
//

import UIKit

protocol AsselderBuilderProtocol {
    func createMainModule() -> UIViewController
    func createDetailModule(comment: Comment?) -> UIViewController
}

class ModuleBuilder: AsselderBuilderProtocol {
    func createDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }

    func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
