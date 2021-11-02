//
//  ShowPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI
import Combine
import FeedKit

struct PodcastPage: View {
    
    var url : String = ""
    var feedURL : URL
    var parser : FeedParser
    @State var show : Show? = nil
    init(url: String) {
        self.url = url
        self.feedURL = URL(string: url)!
        self.parser = FeedParser(URL: self.feedURL)
    }
    
    func loadPodcast(_ finished : @escaping (Show?) -> Void) {
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            // Do your thing, then back to the Main thread
            switch result {
            case .success(let feed):
                
                // Grab the parsed feed directly as an optional rss, atom or json feed object
                feed.rssFeed
                
                // Or alternatively...
                switch feed {
                case let .atom(feed):       // Atom Syndication Format Feed Model
                    show = Show(
                        id: "",
                        name: feed.title!,
                        description: "",
                        imageUrl: "",
                        color: "#888888"
                    )
                    let season = Season(number: 0, show: show!)
                    for episode in feed!.entries {
                        season.episodes.append(
                            Episode(
                                id: "",
                                number: episode.number!,
                                name: episode.title!,
                                description: episode.description!,
                                imageUrl: episode.imageUrl!
                            )
                        )
                    }
                    self.show.seasons.append(season)
                            
                case let .rss(feed):        // Really Simple Syndication Feed Model
                    self.show = Show(
                        id: "",
                        name: feed.name,
                        description: feed.description,
                        imageUrl: feed.imageUrl,
                        color: "#888888"
                    )
                    let season = Season(number: 0, show: self.show)
                    for episode in feed?.items:
                        season.episodes.append(
                            Episode(
                                id: "",
                                number: episode?.number,
                                name: episode?.name,
                                description: episode?.description,
                                imageUrl: episode?.imageUrl,
                            )
                        )
                        self.show.seasons.append(season)
                            
                case let .json(feed):       // JSON Feed Model
                    
                }
                
            case .failure(let error):
                print(error)
            }
        }

    }
    var body: some View {
            VStack {
                if show != nil {
                    ShowView(
                        show: show!
                    )
                } else {
                    Text("Loading")
                }
            }.onAppear(perform: {
                loadShow() {
                    show in
                }
            })
    }
}
 
