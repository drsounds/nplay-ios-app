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
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "nl")
        formatter.setLocalizedDateFormatFromTemplate("dd MMMM")
        return formatter.string(from: episode.published)
    }
    var body: some View {
        NavigationLink(destination: EpisodePage(id: episode.id!)) {
            HStack(alignment: .center, spacing: 1) {
                if episode.imageUrl != nil {
                ImageView(
                    url: episode.imageUrl!
                ).aspectRatio(contentMode: .fit).frame(width: 110, height: 80)
                } else {
                    Rectangle().frame(width: 110,  height: 80)
                }
                VStack {
                    Text(episode.name).bold()
                    Text(formattedDate()).opacity(0.8)
                }
                Spacer()
                Button("..") {
                    onMenuClicked(episode)
                }
            }
        }.buttonStyle(.plain)
    }
}
 
