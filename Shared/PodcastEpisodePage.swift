//
//  EpisodePage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI
import Combine
import FeedKit

struct PodcastEpisodePage: View {
    var parser : PodcastParser
    var url : String = ""
    var args : [String: String]
    var realURL : String
    @State var show : Show? = nil
    @State var episode : Episode? = nil
    @State var season : Season? = nil
    init(url: String) {
        self.url = url.components(separatedBy: ["#"])[0].replacingOccurrences(of: "stadius:", with: "http:")
        self.realURL = url;
        self.args = url.components(separatedBy: ["#"])[1].query
        self.parser = PodcastParser()
    }
    func loadEpisode() {
        self.parser.loadFeed(string: self.url) {
            show in
            if show != nil {
                let seasonValue = self.args["season"]
                let episodeValue = self.args["episode"]
                for season in show!.seasons {
                    if seasonValue != nil && season.id! == seasonValue {
                        self.season = season
                    }
                    for episode in season.episodes {
                        if episode.id! == episodeValue! {
                            self.episode = episode
                            self.season = season
                            self.show = show
                        }
                    }
                }
            }
        }
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            if show != nil && episode != nil {
                PodcastEpisodeView(
                    show: show!,
                    season: season!,
                    episode: episode!
                )
            } else {
                ProgressView()
            }
        }.onAppear(perform: {
            loadEpisode()
        })
    }
}
 
