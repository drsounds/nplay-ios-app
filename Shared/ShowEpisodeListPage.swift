//
//  EpisodePage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI
import Combine

struct ShowEpisodeListPage: View {
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
    init(id: String, defaultSeasonId: String) {
        self.id = id
        showViewLoader = EntityViewLoader(path: "")
        seasonListViewLoader = EntityListViewLoader(path: "")
        episodeListViewLoader = EntityListViewLoader(path: "")
        episodeViewLoader = EntityViewLoader(path: "")
        seasonId = defaultSeasonId
    }
    func loadSeasons(_ showId: String, _ finished: @escaping ([Season]) -> Void) {
        self.seasonListViewLoader.setPath("seasons")
        self.seasonListViewLoader.get(["showId": id]) {
            seasons in
            self.seasons = seasons
            finished(seasons)
        }
    }
    func loadShow(_ showId: String, finished : @escaping (Show?) -> Void) {
        self.showViewLoader.setPath("shows/\(showId)")
        self.showViewLoader.get() {
            show in
            self.show = show
            finished(show)
        }
    }
    func loadEpisodes(_ seasonId: String, finished: @escaping ([Episode]) -> Void) {
        self.episodeListViewLoader.setPath("episodes")
        self.episodeListViewLoader.get(["seasonId": seasonId]) {
            episodes in
            self.episodes = episodes
        }
    }
    var body: some View {
        ZStack {
            if show != nil {
                ShowEpisodeListView(
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
            loadShow(id) {
                show in
                if show != nil {
                    loadSeasons(show!.id!) {
                        seasons in
                        print("Season count \(seasons.count)")
                        if seasons.count > 0 {
                            loadEpisodes(seasons[0].id!) {
                                episodes in
                            }
                        }
                    }
                }
            }
        })
    }
}
 
