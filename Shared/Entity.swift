//
//  Show.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Entity : Identifiable, Codable {
    @DocumentID var id: String? = ""
    var name : String = ""
    var description : String = ""
    var imageUrl : String = ""
    var color : String = "#88888855"
    init() {
    }
    init(id: String?, name: String, description: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
    }
}
