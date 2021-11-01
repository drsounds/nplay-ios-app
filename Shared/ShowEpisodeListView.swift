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
        print("Number of seasons \(self.seasons.count)")
    } 
    var body: some View {
        VStack {
            /*Picker("Seasons", selection: $selectedSeasonId) {
                ForEach(seasons, id: \.id) {
                    Text($0.name).tag($0.id)
                }
            }.onChange(of: selectedSeasonId, perform: seasonChanged)
                .background(Color.black).padding(5.0).cornerRadius(25.0).border(Color.white).foregroundColor(Color.white)*/
            VStack(alignment: .trailing, spacing: 0) {
                HStack {
                    Text("Season")
                
                    ForEach(seasons, id: \.id) {
                        season in
                        Button(season.name, action: {
                            seasonChanged(season.id!)
                        }).buttonStyle(BorderedButtonStyle())
                    }
                }
            }
            Text("Episodes").opacity(0.5)
            VStack {
                ForEach(episodes) {
                    EpisodeRow(episode: $0, onMenuClicked: {
                        episode in
                    })
                }
            }
        }
    }
}
  
