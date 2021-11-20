//
//  StadiusNavigationLink.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-20.
//

import SwiftUI

struct StadiusNavigationLink: View {
    var uri : String
    @State var isActive : Bool = false
    let content: () -> Content
    
    init(_ uriString: String, isActive: Bool, @ViewModel content: @escaping() -> Content) {
        self.uri = uriString
        self.content = content
        self.isActive = isActive
    }
    var body: some View {
        if uri.starts(with: "stadius:") {
            if (uri.starts(with: "stadius:view:")) {
                NavigationLink(destination: BrowsePage(uri: uri), isActive: $isActive) {
                    Text("")
                }
            }
        }
    }
}

struct StadiusNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        StadiusNavigationLink()
    }
}
