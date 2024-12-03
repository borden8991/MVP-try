//
//  Person.swift
//  MVP Try
//
//  Created by Vasily Maslov on 30.11.2024.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}

