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
                ForEach(vm.users) { user in
                    NavigationLink {
                        PostListView(userId: user.id)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.title)
                            Text(user.email)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .listStyle(.plain)
            .onAppear{
                vm.fetchUsers()
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
