//
//  MainPresenterTest.swift
//  MVP TryTests
//
//  Created by Vasily Maslov on 30.11.2024.
//

import XCTest
@testable import MVP_Try

class MockView: MainViewProtocol {
    func success() {
    }
    
    func failure(error: any Error) {
    }
}

final class MainPresenterTest: XCTestCase {

    var view: MockView!
    var networkService: NetworkServiceProtocol!
    var presenter: MainPresenter!
    var router: RouterProtocol!
    var comments = [Comment]()

    override func tearDown() {
        view = nil
        networkService = nil
        presenter = nil
    }

    func testGetSuccesComments() {
        
    }

}
