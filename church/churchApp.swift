//
//  churchApp.swift
//  church
//
//  Created by PK on 05/02/2021.
//

import SwiftUI

@main
struct churchApp: App {
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
