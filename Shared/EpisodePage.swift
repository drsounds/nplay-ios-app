//
//  EpisodePage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI
import Combine

struct EpisodePage: View {
    @ObservedObject var showViewLoader : EntityViewLoader<Show>
  
    @ObservedObject var episodeViewLoader : EntityViewLoader<Episode>
    @State var show : Show? = nil
    @State var episode : Episode? = nil
    @State var seasonId : String = ""
    var id : String = ""
    init(id: String) {
        self.id = id
        print(id)
        showViewLoader = EntityViewLoader(path: "")
        episodeViewLoader = EntityViewLoader(path: "")
    }
    func loadShow(_ showId: String, finished : @escaping (Show?) -> Void) {
        self.showViewLoader.setPath("shows/\(showId)")
        self.showViewLoader.get() {
            show in
            self.show = show
            finished(show)
        }
    }
    func loadEpisode( finished: @escaping (Episode?) -> Void) {
        self.episodeViewLoader.setPath("episodes/\(id)")
        print("Episode \(id)")
        self.episodeViewLoader.get() {
            episode in
            self.episode = episode
            finished(episode)
        }
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            if show != nil && episode != nil {
                EpisodeView(
                    show: show!,
                    episode: episode!,
                    seasonId: episode!.seasonId
                )
            } else {
                ProgressView()
            }
        }.onAppear(perform: {
            loadEpisode() {
                episode in
                if episode != nil {
                    loadShow(episode!.showId) {
                        show in
                    }
                }
            }
        })
    }
}
 
