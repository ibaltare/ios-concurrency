//
//  PostListView.swift
//  IOSConcurrency
//
//  Created by Nicolas on 07/05/23.
//

import SwiftUI

struct PostListView: View {
    @StateObject var vm = PostListViewModel()
    var userId: Int?
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
        .onAppear {
            vm.userId = userId
            vm.fetchPosts()
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(userId: 1)
        }
        
    }
}
