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
    var uri: String
    var model : PodcastEpisodeViewModel
    init(uriString: String) {
        self.uri = uriString
        self.model = PodcastEpisodeViewModel()
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            if (model.status == 200) {
                if model.show != nil && model.episode != nil {
                    PodcastEpisodeView(
                        show: model.show!,
                        season: model.season!,
                        episode: model.episode!,
                        seasonChanged: {
                            seasonId in
                            self.model.selectSeason(seasonId)
                        }
                    )
                } else {
                    Text("Error")
                }
            } else {
                ProgressView()
            }
        }.onAppear(perform: {
            self.model.loadEpisode(uri, finished: {
                result in
            })
        })
    }
}
 
