//
//  UserListView.swift
//  IOSConcurrency
//
//  Created by Nicolas on 07/05/23.
//

import SwiftUI

struct UserListView: View {
    #warning("remove the forPreview argument or set it to false before uploading to App store")
    @StateObject var vm = UserListViewModel(forPreview: true)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.usersAndPost) { userAndPost in
                    NavigationLink {
                        PostListView(posts: userAndPost.posts)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(userAndPost.user.name)
                                    .font(.title)
                                Spacer()
                                Text("(\(userAndPost.numberOfPosts))")
                            }
                            
                            Text(userAndPost.user.email)
                        }
                    }
                }
            }
            .overlay(content: {
                if vm.isLoading {
                    ProgressView()
                }
            })
            .alert("Application Error", isPresented: $vm.showAlert, actions: {
                Button("Ok"){}
            }, message: {
                if let errorMessage = vm.errorMessage {
                    Text(errorMessage)
                }
            })
            .navigationTitle("Users")
            .listStyle(.plain)
            .task {
                await vm.fetchUsers()
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
