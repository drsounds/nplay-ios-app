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
        HStack(alignment: .top, spacing: 3) {
            /*if episode.imageUrl != nil && episode.imageUrl! != "" {
            ImageView(
                url: episode.imageUrl!
            ).aspectRatio(contentMode: .fit).frame(minWidth: 0, maxWidth: 30, minHeight: 0, maxHeight: 30)
            } else {
                Spacer(minLength: 03)
            }*/
            VStack(alignment: .leading, spacing: 2) {
                Text(episode.name).bold().lineLimit(1)
                Text(formattedDate()).opacity(0.8)
            }.padding(13)
            Spacer()
            Button("..") {
                onMenuClicked(episode)
            }
        }.padding(3)
    }
}
 
