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
        ScrollView {
            VStack {
                GenericHeader(
                    title: episode.name,
                    label: "episode",
                    imageUrl: ""
                )
                Button("Play") {
                    print("Play")
                }.buttonStyle(PrimaryButton())
                ShowEpisodeListPage(id: show.id!)
            }.frame(
                minWidth: UIScreen.main.bounds.width,
                minHeight: UIScreen.main.bounds.height
            ).background(
                LinearGradient(
                    colors: [
                        Color(
                            hex: show.color,
                            alpha: 0.8
                        ),
                        Color(
                            hex: show.color,
                            alpha: 0.0
                        )
                    ],
                    startPoint: .top, endPoint: .bottom
                )
            )
        }
    }
} 
