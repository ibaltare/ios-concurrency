//
//  UserAndPost.swift
//  IOSConcurrency
//
//  Created by Nicolas on 08/05/23.
//

import Foundation

struct UserAndPost: Identifiable {
    var id = UUID()
    let user: User
    let posts: [Post]
    var numberOfPosts: Int {
        posts.count
    }
}
