//
//  EpisodeView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct PodcastEpisodeView: View {
    var show : Show
    var season : Season
    var episode : Episode
    var seasonId = ""
    var seasonChanged: (String) -> Void
    var body: some View {
        GenericView(color: Color(hex: episode.color!), imageUrl: nil, height: .bottom, showCircle: true) {
            VStack(alignment: .leading) {
                GenericHeader(
                    title: nil,
                    imageUrl: episode.imageUrl
                )
                Spacer(minLength: 80)
                NavigationLink(
                    destination: EnclosureView(
                        enclosure: episode.enclosures.first!
                    )
                ) {
                    PrimaryButton(title:"Play", click: {}).padding(16)
                }.padding(16)
                Text(episode.name).opacity(1).padding(30).font(.custom("ProJakartaSans-ExtraBold", size: 60).bold())
                Text(episode.description).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).padding(30).font(.system(size: 20, weight: .regular))
                Spacer(minLength: 10)
                PodcastEpisodeListView(show: show, season: season, episode: episode)
            }.frame(
                minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading
            )
        }
    }
}
