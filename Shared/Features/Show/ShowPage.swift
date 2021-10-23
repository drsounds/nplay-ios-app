//
//  ShowPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct ShowPage: View {
    var showViewLoader : EntityViewLoader<Show>
    var id : String = ""
    init(id: String) {
        self.id = id
        self.showViewLoader = EntityViewLoader<Show>(path: id)
        self.showViewLoader.load()
    }
    var body: some View {
        if self.showViewLoader.obj != nil {
            ShowView(show: self.showViewLoader.obj!.obj)
        } else {
            Text("Loading")
        }
    }
}
 
