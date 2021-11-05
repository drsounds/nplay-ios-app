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
        GenericView(color: SwiftUI.Color(hex: show.color, alpha: 0.5), imageUrl: show.imageUrl, height: .center, backgroundColor: SwiftUI.Color(hex: show.color, alpha: 0.3)) {
            GenericHeader(
                title: show.name,
                label: "show",
                imageUrl: nil
            )
            VStack(alignment: .leading, spacing: 16) {
                Text(show.description).font(.custom("PlusJakartaSans-Regular", size: 8))
            }.padding(16)
            PodcastEpisodeListView(show: show, season: show.seasons.first, episode: nil)
        }
    }
}
  
