//
//  ShowView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct ShowEpisodeListView: View {
    var seasons : [Season] = []
    var episodes : [Episode] = []
    var seasonId = ""
    @State var selectedSeasonId : String
    
    var seasonChanged: (_ seasonId: String) -> Void
    init(seasons: [Season], episodes: [Episode], seasonId: String, seasonChanged: @escaping (String) -> Void) {
        self.seasons = seasons
        self.episodes = episodes
        self.seasonId = seasonId
        self.selectedSeasonId = seasonId
        self.seasonChanged = seasonChanged
    }
    var body: some View {
        ScrollView {
            VStack {
                Picker("Seasons", selection: $selectedSeasonId) {
                    ForEach(seasons) {
                        Text($0.name).tag($0.id)
                    }
                }.onChange(of: selectedSeasonId, perform: seasonChanged)
                Text("Episodes").opacity(0.5)
                
            }
        }
    }
}
  
