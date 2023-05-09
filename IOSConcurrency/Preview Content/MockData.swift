//
//  MockData.swift
//  IOSConcurrency
//
//  Created by Nicolas on 07/05/23.
//

import Foundation

extension User {
    static var mockUsers: [User] {
        Bundle.main.decode([User].self, from: "users.json")
    }
    static var mockSingleUser: User {
        self.mockUsers[0]
    }
}

extension Post {
    static var mockPosts: [Post] {
        Bundle.main.decode([Post].self, from: "posts.json")
    }
    static var mockSinglePost: Post {
        self.mockPosts[0]
    }
    
    static var mockSingleUserPostArray: [Post] {
        self.mockPosts.filter { post in
            post.userId == 1
        }
    }
}

extension UserAndPost {
    static var mockUsersAndPosts: [UserAndPost] {
        var newUsersAndPosts: [UserAndPost] = []
        for user in User.mockUsers {
            let newUserAndPosts = UserAndPost(user: user, posts: Post.mockPosts.filter {$0.userId == user.id})
            newUsersAndPosts.append(newUserAndPosts)
        }
        return newUsersAndPosts
    }
}
