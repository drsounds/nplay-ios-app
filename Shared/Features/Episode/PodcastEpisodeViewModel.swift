//
//  PodcastViewModel.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-20.
//

import Foundation


class PodcastEpisodeViewModel : ObservableObject {
    var uri : String?
    var feedUrl : String?
    var feedURL : URL?
    var episodeId: String?
    var parser: PodcastParser
    @Published var status : Int = 100
    @Published var show : Show? = nil
    @Published var season : Season? = nil
    @Published var episode : Episode? = nil
    @Published var selectedSeasonId : String = ""
    init() {
        self.parser = PodcastParser()
    }
    func loadEpisode(_ uriString: String, finished : @escaping (Result<Episode, Error>) -> Void) {
        self.uri = uriString
        self.feedUrl = getUrlFromUri(uriString: uri!)
        self.episodeId = getUrlFromUri(uriString: uri!, pos: 4)
        self.feedURL = URL(string: feedUrl!)!
        self.parser = PodcastParser()
        self.parser.loadFeed(string: self.feedUrl!) {
            result in
            switch (result) {
                case .success(let show):
                    for season in show.seasons {
                        for episode in season.episodes {
                            if episode.id == self.episodeId {
                                self.episode = episode
                                self.season = season
                                self.selectedSeasonId = self.season!.id!
                                self.show = show
                                self.status = 200
                                finished(.success(episode))
                            }
                        }
                    }
                    break
                case .failure(let error):
                    finished(.failure(error))
                    break
            }
        }
    }
    func selectSeason(_ seasonId: String) {
        self.selectedSeasonId = seasonId
    }
}
