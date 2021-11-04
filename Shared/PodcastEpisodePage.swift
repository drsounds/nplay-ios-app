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
    var feedURL : URL
    var parser : FeedParser
    var url : String = ""
    var args : [URLQueryItem]
    var realURL : String
    @State var show : Show? = nil
    @State var episode : Episode? = nil
    @State var season : Season? = nil
    init(url: String) {
        self.feedURL = URL(string: self.url.components(separatedBy: ["#"]).first!)!
        self.realURL = url;
        let urlComponent = URLComponents(string: url) 
        self.parser = FeedParser(URL: self.feedURL)
    }
    func loadEpisode() {
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            // Do your thing, then back to the Main thread
            switch result {
            case .success(let feed):
                
                // Grab the parsed feed directly as an optional rss, atom or json feed object
              
                // Or alternatively...
                switch feed {
                case let .atom(feed):       // Atom Syndication Format Feed Model
                    show = Show(
                        id: "",
                        name: feed.title!,
                        description: "",
                        imageUrl: "",
                        color: "#888888",
                        url: realURL
                    )
                    let season : Season = Season(id: self.url + "#season:1", number: 0, show: show!)
                    var number : Int = 1
                    for episode in feed.entries ?? [] {
                        season.episodes.append(
                            Episode(
                                id: episode.id!,
                                number: number,
                                name: episode.title!,
                                description: episode.summary?.value ?? "",
                                imageUrl: nil,
                                color: "#777777",
                                season: season,
                                url: "\(realURL)#episode=\(episode.id)"
                            )
                        )
                        number += 1
                    }
                    show!.seasons.append(season)
                            
                case let .rss(feed):        // Really Simple Syndication Feed Model
                    self.show = Show(
                        id: "",
                        name: feed.title!,
                        description: "",
                        imageUrl: nil,
                        color: "#888888",
                        url: realURL
                    )
                    let season = Season(id: self.url + "#season:0", number: 0, show: show!)
                    self.season = season
                    var number : Int = 1
                    for episode in feed.items ?? [] {
                        season.episodes.append(
                            Episode(
                                id: episode.guid!.value!,
                                number:number,
                                name: episode.title!,
                                description: episode.description!,
                                imageUrl: nil,
                                color: "#888888",
                                season: season,
                                url: "\(realURL)#episode=\(episode.guid!.value!)"
                            )
                        )
                        number += 1
                    }
                    show!.seasons.append(season)
                            
                case let .json(feed):       // JSON Feed Model
                    return
                }
                
            case .failure(let error):
                print(error)
            }
        }
        if show != nil {
            let seasonValue = self.args.first(
                where: {$0.name == "season"}
            )?.value
            let episodeValue = self.args.first(
                where: {$0.name == "episode"}
            )?.value
            for season in show!.seasons {
                if season.number == NSString(string: seasonValue!).integerValue {
                    self.season = season
                }
                for episode in season.episodes {
                    if episode.number == NSString(string: episodeValue!).integerValue {
                        self.episode = episode
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
                Text("Loading")
            }
        }.onAppear(perform: {
            loadEpisode()
        })
    }
}
 
