//
//  IOSConcurrencyApp.swift
//  IOSConcurrency
//
//  Created by Nicolas on 07/05/23.
//

import SwiftUI

@main
struct IOSConcurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView()
                .onAppear{
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
