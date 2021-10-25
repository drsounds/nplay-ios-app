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
        NavigationView {
            ScrollView {
                VStack {
                    BlockView(
                        items: self.shows,
                        title: "Shows",
                        destination: {
                            item in
                            ShowDetailPage(id: item.id!)
                        }
                    )
                }
                .padding(5)
            }
        }
    }
    
}
