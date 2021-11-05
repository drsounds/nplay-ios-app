//
//  EpisodePlayer.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-02.
//

import SwiftUI

struct EpisodePlayerView: View {
    var episode : Episode
    @State var status : Int = 100
    var storyletService : StoryletService = StoryletService()
    @State var storylet : Storylet? = nil
    func loadStorylet() {
        print("\(episode.enclosures)")
        if episode.enclosures.count > 0 {
            let enclosure = episode.enclosures.first!
            if enclosure.contentType == "application/json" {
                self.storyletService.loadStorylet(enclosure.url, success: {
                    storylet in
                    self.storylet = storylet
                    self.status = 200
                }, failure: {
                    error in
                    self.status = 500
                })
            }
        }
       
    }
    var body: some View {
        if status == 200 {
            if storylet != nil {
                    StoryletPlayerView(storylet: storylet!)
            }
        } else if status == 100 {
            ProgressView().onAppear() {
                loadStorylet()
            }
        } else {
            Text("An error occuring loading the storylet")
        }
    }
}
