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
                .environment(\.managedObjectContext, persistenceController.container.viewContext).onAppear(perform: {
                    let url = URL(string: "stadius://anchor.fm/s/67950a8/podcast/rss")!
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                             print("Open url : \(success)")
                        })
                    }
                    
                })
        }
    }
}
