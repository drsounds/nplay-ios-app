//
//  Show.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Season : Entity {
    var episodes : [Episode] = []
    var number : Int = 0
    var showId : String = ""
    var show: Show? = nil
    var url: String? = ""
    enum CodingKeys: String, CodingKey {
        case number = "numeber"
        case showId = "showId"
    }
    init(id: String, number: Int, show: Show, url: String?, uriString: String?) {
        super.init(id: id, name: "", description: "", imageUrl: "", uriString: uriString)
        self.number = number
        self.url = url
        self.show = show
    }
    required init (from decoder: Decoder) {
        try! super.init(from: decoder)
    }
}
