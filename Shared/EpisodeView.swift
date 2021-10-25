//
//  EpisodeView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct EpisodeView: View {
    var show : Show
    var episode : Episode
    var seasonId = "" 
    var body: some View {
        GenericView(color: Color(hex: episode.color), imageUrl: episode.imageUrl) {
            VStack {
                GenericHeader(
                    title: episode.name,
                    label: "episode",
                    imageUrl: ""
                )
                Button("Play") {
                    print("Play")
                }.buttonStyle(PrimaryButton())
                ShowEpisodeListPage(id: show.id!).frame(width: UIScreen.main.bounds.width)
            }.frame(
                minWidth: UIScreen.main.bounds.width,
                minHeight: UIScreen.main.bounds.height
            )
        }
    }
} 
