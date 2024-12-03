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
         comment: Comment?)
func setComment()
}

class DetailPresenter: DetailViewPresenterProtocol {

    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol?
    var comment: Comment?

    required init(view: any DetailViewProtocol, networkService: any NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
}

