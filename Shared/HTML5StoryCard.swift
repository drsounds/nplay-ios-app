//
//  HTML5StoryCard.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-04.
//

import SwiftUI
import WebKit

struct HTML5StoryCard: View {
    var url : String = ""
    @StateObject var model = WebViewModel()

    var body: some View {
        WebView(webView: model.webView).onAppear(perform: {
            model.loadUrl(url)
        })
    }
}
 
