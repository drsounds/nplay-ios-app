//
//  Show.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Entity : ObservableObject, Identifiable, Codable {
    @DocumentID var id: String? = ""
    var name : String = ""
    var description : String = ""
    var imageUrl : String? = nil
    var color : String? = "#88888855"
    var uri : String? = "stadius:undefined"
    init() {
    }
    init(id: String?, name: String, description: String, imageUrl: String?, uriString: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.uri = uriString
    }
    init(id: String?, name: String, description: String, imageUrl: String?, color: String, uriString: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.color = color
        self.uri = uriString
    }
}
