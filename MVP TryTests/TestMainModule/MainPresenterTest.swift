//
//  MainPresenterTest.swift
//  MVP TryTests
//
//  Created by Vasily Maslov on 30.11.2024.
//

import XCTest
@testable import MVP_Try

class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

final class MainPresenterTest: XCTestCase {

    var view: MockView!
    var person: Comment!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        view = MockView()
        person = Comment(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }

    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "View is not nil")
        XCTAssertNotNil(person, "Person is not nil")
        XCTAssertNotNil(presenter, "Presenter is not nil")
    }

    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }

    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }

}
