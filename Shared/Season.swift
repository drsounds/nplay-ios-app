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
    enum CodingKeys: String, CodingKey {
        case number = "numeber"
        case showId = "showId"
    }
    init(number: Int, show: Show) {
        super.init(id: "", name: "", description: "", imageUrl: "")
        self.number = number
        self.show = show
    }
    required init (from decoder: Decoder) {
        try! super.init(from: decoder)
    }
}
