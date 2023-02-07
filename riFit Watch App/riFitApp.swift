//
//  riFitApp.swift
//  riFit
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI

@main
struct riFitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
