//
//  UserListViewModel.swift
//  IOSConcurrency
//
//  Created by Nicolas on 07/05/23.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var usersAndPost: [UserAndPost] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    @MainActor
    func fetchUsers() async {
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        let apiService2 = APIService(urlString: "https://jsonplaceholder.typicode.com/posts")
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }
        do {
            async let users: [User] = try await apiService.getJSON()
            async let posts: [Post] = try await apiService2.getJSON()
            let (fetchedUsers, fetchedPosts) = await (try users, try posts)
            for user in fetchedUsers {
                let userPosts = fetchedPosts.filter {
                    $0.userId == user.id
                }
                let newUserAndPost = UserAndPost(user: user, posts: userPosts)
                usersAndPost.append(newUserAndPost)
            }
        } catch {
            showAlert = true
            errorMessage = error.localizedDescription + "\nPlease contact the developer..."
        }
    }
    
}

extension UserListViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()
        if forPreview {
            self.usersAndPost = UserAndPost.mockUsersAndPosts
        }
    }
}
