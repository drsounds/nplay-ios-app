//
//  StoryPlayerPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-02.
//

import SwiftUI

struct StoryPlayerPage: View {
    var episodeEntityViewLoader : EntityViewLoader<Episode>? = nil
    mutating func loadStory() {
        self.episodeEntityViewLoader = EntityViewLoader<Episode>(path: "episodes/\(storyId)")
        self.episodeEntityViewLoader?.get(finished: {
            e in
            episode = e
              
        })
    }
    var storyId: String = ""
    @State var storylet : Storylet? = nil
    @State var episode : Episode? = nil
    var body: some View {
        /*if storylet != nil {
            EpisodePlayerView(
                episode: episode!,
                storylet: storylet!
            ) {
                
            }
        } else {*/
            Text("Test").onAppear(perform: {
                
            })/*
        }*/
    
    }
}

struct StoryPlayerPage_Previews: PreviewProvider {
    static var previews: some View {
        StoryPlayerPage()
    }
}
