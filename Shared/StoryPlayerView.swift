//
//  StoryPlayerPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-02.
//

import SwiftUI

struct StoryPlayerView: View {
    var storylet : Storylet
    @State var selection : String = ""
    var body: some View {
        GenericView(color: Color(hex: storylet.color, alpha: 0.5)) {
            TabView(selection: $selection) {
                ForEach(storylet.objects) {
                    storyObject in
                    if storyObject.type == "video" {
                        HTML5StoryCard(url: storyObject.url)
                    }
                    if storyObject.type == "camera" {
                        CameraStoryCard(url: storyObject.url)
                    }
                    if storyObject.type == "bundle" {
                        HTML5StoryCard(url: storyObject.url)
                    }
                }
            }.tabViewStyle(PageTabViewStyle())
        }
    }
}
