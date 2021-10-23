//
//  nPlayApp.swift
//  Shared
//
//  Created by Alexander Forselius on 2021-10-19.
//

import SwiftUI
import Firebase

@main
struct nPlayApp: App {
    let persistenceController = PersistenceController.shared
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
