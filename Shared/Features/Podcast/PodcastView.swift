//
//  ShowView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI
import swift_vibrant

struct PodcastView: View {
    var show : Show
    @State var backgroundColor : SwiftUI.Color? = SwiftUI.Color.black
    init(show: Show) {
        self.show = show
    }
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 90, maxHeight: 90)
                HStack {
                    if (show.imageUrl != nil) {
                        ImageView(url: show.imageUrl!)
                            .aspectRatio(1/1, contentMode: .fill)
                            .frame(
                                minWidth: 0,
                                maxWidth: UIScreen.main.bounds.width / 4,
                                minHeight: 0,
                                maxHeight:UIScreen.main.bounds.width / 4
                            )
                            .shadow(
                                color: Color(
                                    hex: "#000000",
                                    alpha: 0.2
                                ),
                                radius: 7, x: 0, y: 5
                            )
                    }
                    VStack {
                        Text(show.name).font(
                            .custom(
                                "ProJakartaSans-Bold",
                                size: 28
                            )
                        )
                        HStack {
                            PrimaryButton(title: "+", click: {})
                        }
                    }
                }.padding(3).frame(minWidth: 0, maxWidth: .infinity)
                VStack(alignment: .leading, spacing: 16) {
                    Text(show.description).font(.custom("PlusJakartaSans-Regular", size: 8))
                }.padding(16)
                PodcastEpisodeListView(show: show, season: show.seasons.first, episode: nil)
            }
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
  
