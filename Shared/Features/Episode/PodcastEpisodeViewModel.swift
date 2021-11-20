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
    var episodeUri: String?
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
        StadiusService().getEpisodeFromUri(uriString) {
            result in
            switch (result) {
                case .success(let episode):                     
                    self.episode = episode
                    self.season = episode.season
                    self.selectedSeasonId = episode.season!.id!
                    self.show = episode.season!.show!
                    self.status = 200
                    finished(.success(episode))
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
