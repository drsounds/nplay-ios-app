//
//  FeedParser.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-04.
//

import Foundation
import FeedKit

class PodcastParser {
    func loadFeed(_ url: URL, finished: @escaping (Show?) -> Void) {
        let parser = FeedParser(URL: url)
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            // Do your thing, then back to the Main thread
            var show : Show? = nil
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
                        url: url.absoluteString
                    )
                    let season : Season = Season(id: "\(url.absoluteString)#1", number: 0, show: show!)
                
                    for _episode in feed.entries ?? [] {
                        let episode = Episode(
                            id: _episode.id!,
                            number: 1,
                            name: _episode.title!,
                            description: _episode.summary?.value ?? "",
                            imageUrl: nil,
                            color: "#777777",
                            season: season,
                            url: "\(url.absoluteString)#episode=\(_episode.id!)"
                        )
                        if episode.imageUrl == nil {
                            episode.imageUrl = episode.season!.show!.imageUrl
                        }
                        season.episodes.append(
                            episode
                        )
                        /*
                        let _enclosure = _episode.enclosure
                        if _enclosure != nil {
                            let enclosure = Enclosure(
                                name: "",
                                url: _enclosure!.attributes!.url!,
                                contentType: _enclosure!.attributes!.type!,
                                episode: episode
                            )
                            episode.enclosures.append(enclosure)
                        }*/                        
                    }
                    show!.seasons.append(season)
                            
                case let .rss(feed):        // Really Simple Syndication Feed Model
                    show = Show(
                        id: "",
                        name: feed.title!,
                        description: "",
                        imageUrl: feed.image!.url,
                        color: "#888888",
                        url: url.absoluteString
                    )
                    let season = Season(id: "0", number: 0, show: show!)
                    for _episode in feed.items ?? [] {
                        let episode = Episode(
                            id: _episode.guid!.value!,
                            number:1,
                            name: _episode.title!,
                            description: _episode.description!,
                            imageUrl: nil,
                            color: "#888888",
                            season: season,
                            url: "\(url.absoluteString)#episode=\(_episode.guid!.value!)"
                        )
                        if episode.imageUrl == nil {
                            episode.imageUrl = episode.season!.show!.imageUrl
                        }
                        season.episodes.append(
                            episode
                        )
                        let _enclosure = _episode.enclosure
                        if _enclosure != nil {
                            let enclosure = Enclosure(
                                name: "",
                                url: _enclosure!.attributes!.url!,
                                contentType: _enclosure!.attributes!.type!,
                                episode: episode
                            )
                            episode.enclosures.append(enclosure)
                        }
                    }
                    show!.seasons.append(season)
                    finished(show)
                            
                case let .json(feed):       // JSON Feed Model
                    return
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    func loadFeed(string: String, finished: @escaping (Show?) -> Void) {
        let url = string.components(separatedBy: "#").first!
        self.loadFeed(URL(string: url)!, finished: finished)
    }
}
