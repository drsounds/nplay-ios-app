//
//  BrowsePage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct BrowsePage: View {
    var uri : String = "stadius:view:browse"
    @ObservedObject var model : BrowseViewModel
     
    init(_ uriString: String) {
        self.uri = uriString
        self.model = BrowseViewModel()
    }

    var body : some View {
        if (model.status == 200) {
            if (model.canvasObject != nil) {
                BrowseView(canvasObject: model.canvasObject!)
            } else {
                Text("Error")
            }
        } else {
            ProgressView().onAppear(perform: {
                self.model.loadUri(uriString: self.uri)
            })
        }
    }
} 
