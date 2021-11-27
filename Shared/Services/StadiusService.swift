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
                        finished(.failure(NSError("Feed URL couldn't be read from base64")))
                    }
                } else {
                     finished(.failure(NSError("Invalid stadius subsystem")))
                }
            } else {
                finished(.failure(NSError("Invalid service")))
            }
        } else {
            finished(.failure(NSError("Invalid protocol")))
        }
    }
    func getStoryletFromUri(_ uriString: String, finished: @escaping(Result<Storylet, Error>) -> Void) {
        let parts = uriString.components(separatedBy: ":")
        if (parts[0] == "stadius") {
            if (parts.count > 1) {
                if (parts[1] == "storylet") {
                    let base64EncodedStoryletUrl = parts[2]
                    let storyletUrl = base64EncodedStoryletUrl.base64Decoded()
                    StoryletService().loadStorylet(storyletUrl!, finished: finished)
                } else {
                    finished(.failure(NSError("Invalid service")))
                }
            } else {
                finished(.failure(NSError("Invalid URI")))
            }
        } else {
            finished(.failure(NSError("Invalid protocol")))
        }
    }
    func getEpisodeFromUri(_ uriString: String, finished: @escaping(Result<Episode, Error>) -> Void) {
        let parts = uriString.components(separatedBy: ":")
        if (parts[0] == "stadius") {
            if (parts.count > 1) {
                if (parts[1] == "episode") {
                    let episodeIdentifier = getUrlFromUri(uriString: uriString, pos: 2)
              
                    let episodeIdentifierParts = episodeIdentifier.components(separatedBy: ":")
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
                        finished(.failure(NSError("Invalid URI")))
                    }
                } else {
                    finished(.failure(NSError("Invalid URI")))
                }
            } else {
                finished(.failure(NSError("Invalid URI")))
            }
        } else {
            finished(.failure(NSError("Invalid URI")))
        }
    }
    
    func loadStadiusPage(uriString: String, finished: @escaping (Result<CanvasObject, Error>) -> Void) {
        let parts = uriString.components(separatedBy: ":")
        if (parts[0] == "stadius") {
            if (parts.count > 1) {
                if (parts[1] == "view") {
                    if (parts.count > 2) {
                        let path = parts[2...parts.count - 1].joined(separator: "/")
                        let url = "https://api.nplay.se/\(path).json/"
                        print(url)
                        loadJson(fromURLString: url) { (result) in
                        switch result {
                            case .success(let data):
                                let decoder = JSONDecoder()
                                
                                do {
                                    
                                    let canvasObject = try decoder.decode(CanvasObject.self, from: data)
                                    finished(.success(canvasObject))
                                }  catch let jsonError as NSError {
                                    print("JSON decode failed: \(jsonError.localizedDescription)")
                                }
                                break;
                            case .failure(let error):
                                finished(.failure(error))
                            }
                        }
                    } else {
                        finished(.failure(NSError("Invalid URI")))
                    }
                } else {
                    finished(.failure(NSError("Invalid subsystem")))
                    
                }
            } else {
                finished(.failure(NSError("Invalid protocol")))
            }
        }
    }
}
