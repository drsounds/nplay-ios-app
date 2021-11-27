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
            GenericView(color: Color(hex: canvasObject.color!)) {
            
                CanvasView(canvasObject: canvasObject)
                if self.browseUrl != nil {
                    StadiusNavigationLink(uriString: self.browseUrl!, isActive: isActive) {
                        Text("")
                    }
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }.onOpenURL(perform: {
            url in
            self.browseUrl = url.absoluteString
            self.isActive = true
        })
    }
    
}
