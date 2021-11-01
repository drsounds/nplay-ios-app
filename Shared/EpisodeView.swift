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
        GenericView(color: Color(hex: episode.color), imageUrl: nil, height: .bottom) {
            VStack(alignment: .leading) {
                GenericHeader(
                    title: nil,
                    imageUrl: episode.imageUrl
                )
                Spacer(minLength: 30)
                Button("Play") {
                    print("Play")
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center).buttonStyle(PlainButtonStyle()).background(RoundedRectangle(cornerRadius: 8).fill(Color.white)).padding(30).foregroundColor(Color.black)
                Text(episode.name).opacity(1).padding(30).font(.system(size: 30, weight: .bold))
                Text(episode.description).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center).padding(30)
                Spacer(minLength: 10)
                ShowEpisodeListPage(id: show.id!)
            }.frame(
                minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading
            )
        }
    }
} 
