//
//  EpisodeView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-24.
//

import SwiftUI


struct EpisodeRow: View {
    var episode : Episode
    var onMenuClicked : (Episode) -> Void
    var body: some View {
        NavigationLink(destination: EpisodePage(id: episode.id!)) {
            HStack(alignment: .center, spacing: 1) {
                ImageView(
                    url: episode.imageUrl
                )
                VStack {
                    Text(episode.name).bold()
                }
                Button("..") {
                    onMenuClicked(episode)
                }
            }
        }
    }
}
 
