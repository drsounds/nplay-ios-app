//
//  MainView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import SwiftUI
struct MainView : View {
    @State var activeTab : String = ""
    var body : some View {
        TabView(selection: $activeTab) {
            BrowsePage()
                .tabItem {
                    Label("Browse", systemImage: "house.dash")
                }
                .tag("browsePage")
        }.onOpenURL {
            url in
            activeTab = "browsePage"
        }
        /*StoryletTestView()*/
    }
}
