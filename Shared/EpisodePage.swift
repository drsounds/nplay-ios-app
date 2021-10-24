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
    @ObservedObject var seasonListViewLoader : EntityListViewLoader<Season>
    @ObservedObject var episodeListViewLoader : EntityListViewLoader<Episode>
    @ObservedObject var episodeViewLoader : EntityViewLoader<Episode>
    @State var show : Show? = nil
    @State var episode : Episode? = nil
    @State var seasonId : String = ""
    var id : String = ""
    @State var season : Season? = nil
    @State var seasons : [Season] = [];
    @State var episodes : [Episode] = [];
    init(id: String) {
        self.id = id
        showViewLoader = EntityViewLoader(path: "")
        seasonListViewLoader = EntityListViewLoader(path: "")
        episodeListViewLoader = EntityListViewLoader(path: "")
        episodeViewLoader = EntityViewLoader(path: "")
    }
    func loadSeasons(_ showId: String, _ finished: @escaping ([Season]) -> Void) {
        self.seasonListViewLoader.setPath("seasons")
        self.seasonListViewLoader.get(["show": "shows/\(id)"]) {
            seasons in
            self.seasons = seasons
        }
    }
    func loadEpisode(_ finished : @escaping (Episode?) -> Void) {
        self.episodeViewLoader.setPath("episodes/\(id)")
        self.episodeViewLoader.get() {
            episode in
            self.episode = episode
            finished(episode)
        }
    }
    func loadShow(_ showId: String, finished : @escaping (Show?) -> Void) {
        self.showViewLoader.setPath("shows/\(id)")
        self.showViewLoader.get() {
            show in
            self.show = show
            finished(show)
        }
    }
    func loadEpisodes(_ seasonId: String, finished: @escaping ([Episode]) -> Void) {
        self.episodeListViewLoader.setPath("shows/\(id)/seasons/\(seasonId)/episodes")
        self.episodeListViewLoader.get(["show": "seasons/\(seasonId)"]) {
            episodes in
            self.episodes = episodes
        }
    }
    var body: some View {
        ZStack {
            if show != nil && season != nil && episode != nil {
                EpisodeView(
                    show: show!,
                    episode: episode!,
                    season: season!,
                    seasons: seasons,
                    episodes: episodes,
                    seasonId: seasonId,
                    seasonChanged: {
                        seasonId in
                        self.loadEpisodes(seasonId) {
                            episodes in
                        }
                    }
                )
            } else {
                Text("Loading")
            }
        }.onAppear(perform: {
            loadEpisode() {
                episode in
                if episode != nil {
                    loadShow(episode!.show) {
                        show in
                        if show != nil {
                            loadSeasons(show!.id!) {
                                seasons in
                                
                            }
                        }
                    }
                }
            }
        })
    }
}
 
