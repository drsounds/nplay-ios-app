//
//  BrowseView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import SwiftUI

struct BrowseView : View {          
    var canvasObject: CanvasObject
    @State var browseUrl : String? = nil
    @State var isActive : Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                CanvasView(canvasObject: canvasObject)
                if self.browseUrl != nil {
                    StadiusNavigationLink(uriString: self.browseUrl!, isActive: isActive) {
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
