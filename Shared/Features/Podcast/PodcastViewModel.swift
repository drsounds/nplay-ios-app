//
//  PodcastViewModel.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-20.
//

import Foundation


class PodcastViewModel : ObservableObject {
    var uri : String?
    var realUrl : String?
    var feedUrl : URL?
    var parser: PodcastParser
    @Published var status : Int = 100
    @Published var show : Show? = nil
    @Published var season : Season? = nil
    init() {
        self.parser = PodcastParser()
    }
    func loadShow(_ uriString: String, finished : @escaping (Result<Show, Error>) -> Void) {
        self.uri = uriString
        self.realUrl = getUrlFromUri(uriString: uri!)
        self.feedUrl = URL(string: realUrl!)!
        self.parser = PodcastParser()
        self.parser.loadFeed(self.feedUrl!) {
            result in
            switch(result) {
                case .success(let show):
                    self.show = show
                    self.season = self.show!.seasons.first!
                    self.status = 200
                    finished(.success(show))
                    break;
                case .failure(let error):
                    finished(.failure(error))
            }
        }
    }
}
