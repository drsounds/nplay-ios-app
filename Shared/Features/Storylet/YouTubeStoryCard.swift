//
//  YouTubeStoryCard.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-20.
//

import SwiftUI

struct YouTubeStoryCard: View {
    var storyletObject : StoryletObject
    @StateObject var model = WebViewModel()
    
    var body: some View {
        WebView(webView: model.webView).onAppear(perform: {
            model.loadUrl("\(storyletObject.url)?playsinline=1&autoplay=1")
        })
    }
} 
