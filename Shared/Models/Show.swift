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
    init(id: String?, name: String, description: String, imageUrl: String?, color: String, url: String?) {
        super.init(id: id, name: name, description: description, imageUrl: imageUrl, color: color);
        self.url = url
    }
    override init(id: String?, name: String, description: String, imageUrl: String?, color: String) {
        super.init(id: id, name: name, description: description, imageUrl: imageUrl, color: color); 
    } 
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}
