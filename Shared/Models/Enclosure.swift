//
//  Enclosure.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-04.
//

import Foundation

class Enclosure : Codable {
    var name : String
    var url : String
    var contentType : String
    var episode : Episode
    init(name: String, url: String, contentType: String, episode: Episode) {
        self.name = name
        self.url = url
        self.contentType = contentType
        self.episode = episode
    }
}
