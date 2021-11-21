//
//  StadiusNavigationLink.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-20.
//

import SwiftUI

struct StadiusNavigationLink<Content : View>: View {
    var uri : String
    @State var isActive : Bool = false
    let content: () -> Content	
    
    init(uriString: String, isActive: Bool, @ViewBuilder content: @escaping() -> Content) {
        self.uri = uriString
        self.content = content
        self.isActive = isActive
    }
    var body: some View {
        if uri.starts(with: "stadius:") {
            if (uri.starts(with: "stadius:view:")) {
                NavigationLink(destination: BrowsePage(uriString: uri), isActive: $isActive) {
                    Text("")
                }
            }
            if (uri.starts(with: "stadius:show:")) {
                NavigationLink(destination: PodcastPage(uriString: uri), isActive: $isActive) {
                    Text("")
                }
            }
            if (uri.starts(with: "stadius:episode:")) {
                NavigationLink(destination: PodcastEpisodePage(uriString: uri), isActive: $isActive) {
                    Text("")
                }
            }
        }
    }
}
 
