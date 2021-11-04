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
    
    var url : String = ""
    var feedURL : URL
    var realURL : String = ""
    @State var seasonId : String = ""
    @State var season : Season? = nil
    var parser : PodcastParser
    @State var show : Show? = nil
    init(url: String) {
        self.realURL = url
        self.url = url.components(separatedBy: ["#"])[0].replacingOccurrences(of: "stadius:", with: "https:")
        self.feedURL = URL(string: self.url)!
        self.parser = PodcastParser()
    }
    
    func loadShow(_ finished : @escaping (Show?) -> Void) {
        self.parser.loadFeed(self.feedURL) {
            show in
            self.show = show
            self.season = self.show!.seasons.first!
            finished(show)
        }
    }
    var body: some View {
        VStack {
            if show != nil && season != nil  {
                PodcastView(
                    show: show!
                )
                
            } else {
                ProgressView()
            }
        }.onAppear(perform: {
            loadShow() {
                show in
            }
        })
    }
}
 
