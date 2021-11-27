//
//  StoryObject.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-02.
//

import Foundation

class StoryletObject : Codable, Identifiable {
    var name : String?
    var description : String?
    var type : String?
    var url : String?
    var canvasObject: CanvasObject? = nil
    init(name: String, description: String, type: String, url: String) {
        self.name = name
        self.description = description
        self.type = type
        self.url = url
    } 
}
