//
//  PostListView.swift
//  IOSConcurrency
//
//  Created by Nicolas on 07/05/23.
//

import SwiftUI

struct PostListView: View {
    var posts: [Post]
    var body: some View {
        List {
            ForEach(posts) { post in
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
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(posts: Post.mockSingleUserPostArray)
        }
        
    }
}
