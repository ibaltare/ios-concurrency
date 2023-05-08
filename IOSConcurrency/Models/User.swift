//
//  User.swift
//  IOSConcurrency
//
//  Created by Nicolas on 07/05/23.
//

import Foundation

// Source: https://jsonplaceholder.typicode.com/users

struct User: Decodable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
