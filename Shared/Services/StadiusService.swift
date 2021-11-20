//
//  StadiusService.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-20.
//

import Foundation

func getUrlFromUri(uriString: String, pos: Int = 2) -> String {
    let parts = uriString.components(separatedBy: [":"])
    let base64EncodedUrl = parts[pos]
    let url = base64EncodedUrl.base64Decoded()
    return url ?? ""
}

class StadiusService {
    func getPodcastFromUri(_ uriString: String, finished: @escaping(Result<Show, Error>) -> Void) {
        let parts = uriString.components(separatedBy: ":")
        if (parts[0] == "stadius") {
            if (parts.count > 1) {
                if (parts[1] == "podcast") {
                    let base64EncodedFeedUrl = getUrlFromUri(uriString: uriString, pos: 2)
                    let feedUrl = base64EncodedFeedUrl.base64Decoded()
                    if (feedUrl != nil) {
                        PodcastParser().loadFeed(string: feedUrl!, finished: finished)
                    } else {
                        
                    }
                }
            }
        }
    }
    func getEpisodeFromUri(_ uriString: String, finished: @escaping(Result<Episode, Error>) -> Void) {
        let parts = uriString.components(separatedBy: ":")
        if (parts[0] == "stadius") {
            if (parts.count > 1) {
                if (parts[1] == "episode") {
                    let base64EncodedEpisodeIdentifier = getUrlFromUri(uriString: uriString, pos: 2)
                    let episodeIdentifier = base64EncodedEpisodeIdentifier.base64Decoded()
                    if (episodeIdentifier == nil) {
                        return
                    }
                    let episodeIdentifierParts = episodeIdentifier!.components(separatedBy: ":")
                    if (episodeIdentifierParts.count < 2) {
                        return
                    }
                    let base64EncodedFeedUrl = episodeIdentifierParts[0]
                    let base64EncodedEpisodeId = episodeIdentifierParts[1]
                    let feedUrl = base64EncodedFeedUrl.base64Decoded()
                    let episodeId = base64EncodedEpisodeId.base64Decoded()
                    if (feedUrl != nil && episodeId != nil) {
                        PodcastParser().loadEpisode(feedUrl!, episodeId: episodeId!, finished: finished)
                    } else {
                        
                    }
                }
            }
        }
    }
    
    func loadStadiusPage(uriString: String, finished: @escaping (Result<CanvasObject, Error>) -> Void) {
        let parts = uriString.components(separatedBy: ":")
        if (parts[0] == "stadius") {
            if (parts.count > 1) {
                if (parts[1] == "view") {
                    if (parts.count > 2) {
                        let path = parts[2...parts.count].joined(separator: "/")
                        let url = "https://api.nplay.se/\(path).json"
                        loadJson(fromURLString: url) { (result) in
                        switch result {
                            case .success(let data):
                                let decoder = JSONDecoder()
                                if let canvasObject = try? decoder.decode(CanvasObject.self, from: data) {
                                    finished(.success(canvasObject))
                                }
                                break;
                            case .failure(let error):
                                finished(.failure(error))
                            }
                        }
                    }
                }
            }
        }
    }
}
