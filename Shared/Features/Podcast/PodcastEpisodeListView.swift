//
//  ShowView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct PodcastEpisodeListView: View {
    var show : Show
    var season : Season
    var episode : Episode
    @State var selectedSeason : Season? = nil
    func seasonChanged (_ seasonId: String?) {
        if seasonId != nil {
            for season in show.seasons {
                if season.id == seasonId! {
                    _selectedSeason.wrappedValue = season
                }
            }
        }
    }
    init(show: Show, season: Season?, episode: Episode?) {
        self.show = show
        if season != nil {
            self.season = season!
        } else {
            self.season = self.show.seasons[0]
        }
        if episode != nil {
            self.episode = episode!
        } else {
            self.episode = show.seasons.first!.episodes.first!
        }
        _selectedSeason = State(wrappedValue: self.season)
    }
   
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .trailing, spacing: 0) {
                HStack {
                    Text("Season")
                    Spacer()
                    ForEach(show.seasons, id: \.id) {
                        season in
                        Button(season.name, action: {
                            seasonChanged(season.id!)
                        }).buttonStyle(BorderedButtonStyle())
                    }
                }.padding(16)
            }
            Text("Episodes").opacity(0.5).padding(16)
            VStack(alignment: .leading, spacing: 13) {
                if selectedSeason != nil {
                    ForEach(selectedSeason!.episodes) {
                        episode in
                        NavigationLink(destination: PodcastEpisodePage(url: episode.url!)) {
                            EpisodeRow(episode: episode, onMenuClicked: {
                                episode in
                            })
                        }.buttonStyle(.plain)
                    }
                }
            }
        }
    }
}
  
