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
    var season : Season
    var seasons : [Season] = []
    var episodes : [Episode] = []
    @State var seasonId = ""
    var seasonChanged: (_ seasonId: String) -> Void 
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
                Picker("Seasons", selection: $seasonId) {
                    ForEach(seasons, id: \.id) {
                        Text($0.name)
                    }
                }.onChange(of: seasonId, perform: seasonChanged)
                Text("Episodes").opacity(0.5)
                
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
 
struct ShowView_Previews : PreviewProvider {
    static var previews : some View {
        ShowView(
            show: Show(
                id: "1",
                name: "Test",
                description: "Tet",
                imageUrl: ""
            ),
            seasonChanged: {
                seasonId in
            }
        )
    }
}
