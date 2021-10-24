//
//  BrowsePage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct BrowsePage: View {
    @ObservedObject var showListViewLoader = EntityListViewLoader<Show>(
        path: "shows"
    )
    init() {
        self.showListViewLoader.get(nil) {
            objects in
        }
    }

    var body : some View {
        BrowseView(shows: showListViewLoader.objectViewModels.map {
            $0.obj!
        })
    }
}

struct BrowsePage_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView(shows: [])
    }
}
