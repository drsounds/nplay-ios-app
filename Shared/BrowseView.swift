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
    @State var browseUrl : String? = nil
    @State var isActive : Bool = false
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
                if browseUrl != nil {
                    NavigationLink(destination: PodcastPage(url: browseUrl!), isActive: $isActive) {
                        Text("")
                    }
                }
            }
        }.onOpenURL(perform: {
            url in
            self.browseUrl = url.absoluteString
            self.isActive = true
        })
    }
    
}
