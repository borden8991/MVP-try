//
//  RouterProtocol.swift
//  MVP Try
//
//  Created by Vasily Maslov on 03.12.2024.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AsselderBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(comment: Comment?)
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AsselderBuilderProtocol?

    init(navigationController: UINavigationController, assemblyBuilder: AsselderBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func initialViewController() {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createMainModule()
            else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createDetailModule(comment: comment)
            else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }

    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }

}
