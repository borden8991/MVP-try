//
//  DetailPresenter.swift
//  MVP Try
//
//  Created by Vasily Maslov on 30.11.2024.
//

import Foundation


protocol DetailViewProtocol: class {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol,
         networkService: NetworkServiceProtocol,
         router: RouterProtocol,
         comment: Comment?)
    func setComment()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {

    weak var view: DetailViewProtocol?
    var router: RouterProtocol
    let networkService: NetworkServiceProtocol?
    var comment: Comment?

    required init(view: any DetailViewProtocol, networkService: any NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }

    func tap() {
        router.popToRoot()
    }

}

