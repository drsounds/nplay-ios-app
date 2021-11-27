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
        segments: [
            StorySegment(
                id: "",
                name: "Start",
                description: "test",
                objects: [
                    StoryletObject(
                        name: "Test",
                        description: "Test",
                        type: "youtube",
                        url: "https://www.youtube.com/embed/ascGICjdrL8"
                    )
                ]
            ),
            StorySegment(
                id: "",
                name: "Start",
                description: "test",
                objects: [
                    StoryletObject(
                        name: "Test",
                        description: "Test",
                        type: "youtube",
                        url: "https://www.youtube.com/embed/mljuv6r8N-w"
                    )
                ]
            )
        ]
    )
    
    var body: some View {
        StoryletView(storylet: storylet)
    }
}
