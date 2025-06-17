//
//  PackitApp.swift
//  Packit
//
//  Created by Bowon Han on 5/17/25.
//

import SwiftUI

@main
struct PackitApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var navigationCoordinator = NavigationCoordinator()
    
    init() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationCoordinator.path) {
                Group {
                    if isLoggedIn {
                        MainView()
                    } else {
                        LoginView()
                    }
                }
                .navigationDestination(for: AppRoute.self) { $0.destinationView() }
            }
            .environmentObject(loginViewModel)
            .environmentObject(navigationCoordinator)
        }
    }
}
