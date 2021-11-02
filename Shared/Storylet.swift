//
//  Storylet.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-02.
//

import Foundation

struct Storylet : Codable {
    var name : String = ""
    var description : String = ""
    var objects : [StoryObject] = []
}
