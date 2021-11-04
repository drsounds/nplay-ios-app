//
//  StoryletTestView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-04.
//

import SwiftUI

struct StoryletTestView: View {
    var storylet : Storylet = Storylet(
        id: "test",
        name: "Test",
        description: "",
        objects: [
            StoryObject(
                name: "Test",
                description: "Test",
                type: "video",
                url: "https://www.youtube.com/embed/ascGICjdrL8"
            ),
            StoryObject(
                name: "Test",
                description: "Test",
                type: "camera",
                url: "stadius:show:test:segment:280125:particpation"
            )
        ]
    )
    
    var body: some View {
        StoryPlayerView(storylet: storylet)
    }
}
