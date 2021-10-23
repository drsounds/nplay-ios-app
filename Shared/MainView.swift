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
            BrowsePage()
                .tabItem {
                    Label("Browse", systemImage: "house.dash")
                }
            BrowsePage()
                .tabItem {
                    Label("Browse", systemImage: "list.dash")
                }
        }
    }
}
