//
//  EpisodeView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI
import swift_vibrant

struct PodcastEpisodeView: View {
    var show : Show
    var season : Season
    var episode : Episode
    var seasonId = ""
    
    var seasonChanged: (String) -> Void
    @State var backgroundColor: SwiftUI.Color? = Color.black
    var body: some View {
        GenericView(color: Color(hex: episode.color!), imageUrl: nil, height: .center, showCircle: true) {
            VStack(alignment: .center) {
                HStack {
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 90, maxHeight: 90)
                ImageView(url: episode.imageUrl!)
                    .aspectRatio(1/1, contentMode: .fit)
                    .frame(
                        minWidth: 0,
                        maxWidth: UIScreen.main.bounds.width - 16,
                        minHeight: 0,
                        maxHeight: UIScreen.main.bounds.width - 16
                    )
                NavigationLink(
                    destination: EnclosureView(
                        enclosure: episode.enclosures.first!
                    )
                ) {
                    Text("Play").padding(EdgeInsets(top: 10, leading: 60, bottom: 10, trailing: 60))
                        .font(Font.custom("PlusJakartaSans-ExtraBold", size: 16))
                        .background(
                            LinearGradient(
                                colors: [.accentColor, .accentColor.opacity(0.7)],
                                startPoint: UnitPoint(x:0, y: 0),
                                endPoint:  UnitPoint(x:0, y: 1)
                            )
                        )
                        .foregroundColor(Color(UIColor.white))
                        .clipShape(Capsule())
                }.padding(16)
                Text(episode.name).opacity(1).padding(30).font(.custom("ProJakartaSans-ExtraBold", size: 30).bold())
                Text(episode.description).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).padding(30).font(.system(size: 20, weight: .regular))
                Spacer(minLength: 10)
                PodcastEpisodeListView(show: show, season: season, episode: episode)
            }.frame(
                minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading
            )
        }.background(backgroundColor).ignoresSafeArea(.all).onAppear(perform: {
            if show.imageUrl != nil {
                let url = URL(string: show.imageUrl!)
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                    DispatchQueue.main.async {
                        let image = UIImage(data: data!)
                        Vibrant.from(image!).getPalette({ (palette : Palette) in
                            backgroundColor = Color(palette.DarkMuted!.uiColor)
                        })
                    }
                }
            }
        })
    }
}
