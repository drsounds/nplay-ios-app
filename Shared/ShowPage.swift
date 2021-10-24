//
//  ShowPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI
import Combine

struct ShowPage: View {
    @ObservedObject var showViewLoader : EntityViewLoader<Show>
    @ObservedObject var seasonListViewLoader : EntityListViewLoader<Season>
    @ObservedObject var episodeListViewLoader : EntityListViewLoader<Episode>
    @State var show : Show? = nil
    @State var seasonId : String = ""
    var id : String = ""
    @State var seasons : [Season] = [];
    @State var episodes : [Episode] = [];
    init(id: String) {
        self.id = id
        showViewLoader = EntityViewLoader(path: "")
        seasonListViewLoader = EntityListViewLoader(path: "")
        episodeListViewLoader = EntityListViewLoader(path: "")
    }
    func loadSeasons(_ finished: @escaping ([Season]) -> Void) {
        self.seasonListViewLoader.setPath("seasons")
        self.seasonListViewLoader.get(["show": "\(id)"]) {
            seasons in
            print(seasons)
            self.seasons = seasons
        }
    }
    func loadShow(_ finished : @escaping (Show?) -> Void) {
        self.showViewLoader.setPath("shows/\(id)")
        self.showViewLoader.get() {
            show in
            self.show = show
            finished(show)
        }
    }
    func loadEpisodes(_ seasonId: String, finished: @escaping ([Episode]) -> Void) {
        self.episodeListViewLoader.setPath("episodes")
        self.episodeListViewLoader.get(["season": "seasons/\(seasonId)"]) {
            episodes in
            self.episodes = episodes
            finished(episodes)
        }
    }
    var body: some View {
        ZStack {
            if show != nil {
                ShowView(
                    show: show!,
                    seasons: seasons,
                    episodes: episodes,
                    seasonId: seasonId,
                    seasonChanged: {
                        seasonId in
                        loadEpisodes(seasonId) {
                            episodes in
                            self.episodes = episodes
                        }
                    } 
                )
            } else {
                Text("Loading")
            }
        }.onAppear(perform: {
            loadShow() {
                show in
                if show != nil {
                    loadSeasons() {
                        seasons in
                        
                    }
                }
            }
        })
    }
}
 
