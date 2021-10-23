//
//  MainView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import SwiftUI
struct MainView : View {
    var body : some View {
        TabView {
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "house.dash")
                }
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "list.dash")
                }
        }
    }
}
