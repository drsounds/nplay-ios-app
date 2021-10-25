//
//  ShowDetailPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-25.
//

import SwiftUI

struct ShowDetailPage: View {
    @State var show : Show? = nil
    var id : String = ""
    var showViewLoader : EntityViewLoader<Show>
    init(id: String) {
        self.id = id
        self.showViewLoader = EntityViewLoader(path: "shows/\(id)")
    }
    func loadShowDetail(_ finished : @escaping (Show?) -> Void) {
        self.showViewLoader.setPath("shows/\(id)")
        self.showViewLoader.get() {
            show in
            self.show = show
            finished(show)
        }
    }
    var body : some View {
        ZStack {
            if show != nil {
                GenericView(
                    color: Color(hex: show!.color),
                    imageUrl: show!.imageUrl
                ) {
                    
                    ShowView(show: show!)
                     
                    ShowEpisodeListPage(id: id)
                }.frame(
                    minWidth: UIScreen.main.bounds.width,
                    minHeight: UIScreen.main.bounds.height
                )
            } else {
                Text("Show not found")
            }
        }.onAppear(perform: {
            loadShowDetail() {
                show in
            }
        })
    }
}
 
