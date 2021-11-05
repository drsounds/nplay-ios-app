//
//  ShowView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct PodcastView: View {
    var show : Show
    init(show: Show) {
        self.show = show
    }
    var body: some View {
        GenericView(color: Color(hex: show.color, alpha: 0.5), imageUrl: show.imageUrl) {
            GenericHeader(
                title: show.name,
                label: "show",
                imageUrl: nil
            )
            VStack(alignment: .leading, spacing: 30) {
                Text("Description").opacity(0.5)
                Text(show.description)                
            }.padding(30)
            PodcastEpisodeListView(show: show, season: show.seasons.first, episode: nil)
        }
    }
}
  
