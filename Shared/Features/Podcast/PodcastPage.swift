//
//  ShowPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI
import Combine
import FeedKit

struct PodcastPage: View {
    
    var uri : String = ""
    @ObservedObject var model : PodcastViewModel
    var body: some View {
        VStack {
            if model.show != nil && model.season != nil  {
                PodcastView(
                    show: model.show!
                )
            } else {
                ProgressView()
            }
        }.onAppear(perform: {
            model.loadShow(uri) {
                show in
            }
        })
    }
}
 
