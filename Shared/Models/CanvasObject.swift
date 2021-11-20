//
//  CanvasObject.swift
//  nPlay (iOS)
//
//  Created by Alexander Forselius on 2021-11-17.
//

import Foundation

struct CanvasObject : Codable, Identifiable {
    var id : String?
    var name : String?
    var description : String?
    var imageUrl : String?
    var type : String?
    var subType : String?
    var color : String?
    var uri: String?
    var objects: [CanvasObject] = []
}
