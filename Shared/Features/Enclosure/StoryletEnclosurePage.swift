//
//  EpisodePlayer.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-02.
//

import SwiftUI

struct StoryletEnclosurePage: View {
    var uri : String
    @ObservedObject var model : StoryletEnclosureViewModel = StoryletEnclosureViewModel()
    
    var body: some View {
        if model.status == 200 {
            if model.storylet != nil {
                StoryletView(storylet: model.storylet!)
            }
        } else if model.status == 100 {
            ProgressView().onAppear() {
                model.loadStorylet(uri)
            }
        } else {
            Text("An error occuring loading the storylet")
        }
    }
}
