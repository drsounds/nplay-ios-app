//
//  BrowseView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import SwiftUI

struct BrowseView : View {          
    
    var shows : [Show] = [];
    var body: some View {
        ScrollView {
            VStack {
                BlockView(
                    items: self.shows,
                    title: "Shows"
                )
            }
            .padding(5)
        }
    }
    
}
