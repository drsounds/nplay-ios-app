//
//  EpisodePlayer.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-02.
//

import SwiftUI

struct EpisodePlayerView: View {
    var episode : Episode 
    var body: some View {
        GenericView(color: Color(hex: episode.color), imageUrl: nil, height: .bottom) {
            VStack {
                Text(episode.name)
                ScrollView {
                    
                }
            }
        }
    }
}
