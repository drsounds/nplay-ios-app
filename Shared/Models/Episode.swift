//
//  Show.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Episode : Entity { 
    var number : Int = 0
    var showId : String = ""
    var seasonId : String = ""
    var published : Date = Date()
    var season : Season? = nil
    var url : String? = nil
    var enclosures : [Enclosure] = []
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case imageUrl = "imageUrl"
        case color = "color"
        case number = "number"
        case showId = "showId"
        case seasonId = "seasonId"
        case published = "published"
        case uri = "uri"
    }
    init(id: String?, number: Int, name: String, description: String, imageUrl: String?, color: String, season: Season, uriString: String?) {
        super.init(id: id, name: name, description: description, imageUrl: imageUrl, color: color, uriString: uriString)
        self.number = number
        self.season = season
    }
    init(id: String?, number: Int, name: String, description: String, imageUrl: String?, color: String, season: Season, url: String?, uriString: String?) {
        super.init(id: id, name: name, description: description, imageUrl: imageUrl, color: color, uriString: uriString)
        self.number = number
        self.season = season
        self.url = url
        
    }
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        number = try values.decode(Int.self, forKey: .number)
        showId = try values.decode(String.self, forKey: .showId)
        seasonId = try values.decode(String.self, forKey: .seasonId)
        published = try values.decode(Date.self, forKey: .published)
        color = try values.decode(String.self, forKey: .color)
    }
    
}
