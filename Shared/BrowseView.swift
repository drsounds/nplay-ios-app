//
//  BrowseView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import SwiftUI

struct BrowseView : View {          
    private var gridItems = [GridItem(.flexible()), GridItem(.flexible())];
    @ObservedObject var showListViewModel = EntityListViewModel<Show>(
        path: "shows"
    )
    
    var body : some View {
        ScrollView {
            VStack {
                BlockView(
                    items: self.showListViewModel.objectViewModels.map {
                            $0.obj
                    },
                    title: "Shows"
                )
            }
        }
    }
}
