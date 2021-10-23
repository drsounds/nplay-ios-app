//
//  ShowPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct ShowPage: View {
    @ObservedObject var showViewLoader : EntityViewLoader<Show>
    var id : String = ""
    init(id: String) {
        self.id = id
        showViewLoader = EntityViewLoader(path: "shows/\(id)")
    }
    var body: some View {
        ZStack {
            if showViewLoader.obj.obj != nil {
                ShowView(show: showViewLoader.obj.obj!)
            } else {
                Text("Loading")
            }
        }.onAppear(perform: {
            print(id)
            self.showViewLoader.setPath("shows/\(id)")
            self.showViewLoader.get();
        })
    }
}
 
