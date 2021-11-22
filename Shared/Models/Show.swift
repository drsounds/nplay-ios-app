//
//  Show.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Show : Entity {
    var seasons : [Season] = []
    var url : String? = nil
    var episodes : [Episode] = []
    init(id: String?, name: String, description: String, imageUrl: String?, color: String, url: String?, uriString: String?) {
        super.init(id: id, name: name, description: description, imageUrl: imageUrl, color: color, uriString: uriString);
        self.url = url
    }
    override init(id: String?, name: String, description: String, imageUrl: String?, color: String, uriString: String?) {
        super.init(id: id, name: name, description: description, imageUrl: imageUrl, color: color, uriString: uriString);
    } 
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}
