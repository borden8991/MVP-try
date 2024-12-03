//
//  MainPresenter.swift
//  MVP Try
//
//  Created by Vasily Maslov on 30.11.2024.
//

import Foundation

// дз - форматирование

//дока для методов и свойтв в протоколах
protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)


    /// Создаёт комментарии.
func getComments()


    /// <#Description#>
    var comments: [Comment]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    var comments: [Comment]?
    weak private var view: MainViewProtocol?
    private let networkService: NetworkServiceProtocol?


    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }

    func getComments() {
        networkService?.getComments { [weak self] result in
//            guard let self = self else { return }

            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }

}
