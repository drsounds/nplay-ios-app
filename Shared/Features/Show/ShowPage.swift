//
//  ShowPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI
import Combine

struct ShowPage: View {
    @ObservedObject var showViewLoader : EntityViewLoader<Show>
    @State var show : Show? = nil
    var id : String = ""
    init(id: String) {
        self.id = id
        showViewLoader = EntityViewLoader(path: "shows/\(id)")
    }
    var body: some View {
        ZStack {
            if show != nil {
                ShowView(show: show!)
            } else {
                Text("Loading")
            }
        }.onAppear(perform: {
            self.showViewLoader.setPath("shows/\(id)")
            self.showViewLoader.get() {
                show in
                self.show = show
            }
        })
    }
}
 
