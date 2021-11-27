//
//  Storylet.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-02.
//

import Foundation

struct StorySegment : Codable, Identifiable {
    var id : String? = ""
    var name : String = ""
    var description : String? = ""
    var objects : [StoryletObject]? = []
}
