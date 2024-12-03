//
//  DetailViewController.swift
//  MVP Try
//
//  Created by Vasily Maslov on 30.11.2024.
//

import UIKit

class DetailViewController: UIViewController {

    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    var presenter: DetailViewPresenterProtocol?

    func createLabelConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            mainLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainLabel)
        presenter?.setComment()
        createLabelConstraints()
    }

}

extension DetailViewController: DetailViewProtocol {

    func setComment(comment: Comment?) {
        mainLabel.text = comment?.body
    }
    
}





    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


