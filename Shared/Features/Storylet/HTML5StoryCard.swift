//
//  HTML5StoryCard.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-04.
//

import SwiftUI
import WebKit

struct HTML5StoryCard: View {
    var storyletObject : StoryletObject
    @StateObject var model = WebViewModel()
    // "\(storyObjectrl)?playsinline=1&autoplay=1"
    var body: some View {
        WebView(webView: model.webView).onAppear(perform: {
            model.loadUrl(storyletObject.url!)
        })
    }
}
 
