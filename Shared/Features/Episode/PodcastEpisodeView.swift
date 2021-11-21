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
        GenericView(color: Color(hex: episode.color), imageUrl: nil, height: .bottom, showCircle: true) {
            VStack(alignment: .leading) {
                GenericHeader(
                    title: nil,
                    imageUrl: episode.imageUrl
                )
                Spacer(minLength: 30)
                NavigationLink(destination: EpisodePlayerView(episode: episode)) {
                    Text("Play")
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center).buttonStyle(PlainButtonStyle()).background(RoundedRectangle(cornerRadius: 28).fill(Color.white)).padding(30).foregroundColor(Color.black)
                Text(episode.name).opacity(1).padding(30).font(.system(size: 30, weight: .bold))
                Text(episode.description).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).padding(30).font(.system(size: 20, weight: .regular))
                Spacer(minLength: 10)
                PodcastEpisodeListView(show: show, season: season, episode: episode)
            }.frame(
                minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading
            )
        }
    }
}
