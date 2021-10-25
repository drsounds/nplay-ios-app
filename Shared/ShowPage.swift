//
//  ShowPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ShowPage: View {
    @ObservedObject var showViewLoader : EntityViewLoader<Show>
    @State var show : Show? = nil
    var id : String = ""
    init(id: String) {
        self.id = id
        showViewLoader = EntityViewLoader(path: "")
    }
    func loadShow(_ finished : @escaping (Show?) -> Void) {
        self.showViewLoader.setPath("shows/\(id)")
        self.showViewLoader.get() {
            show in
            self.show = show
            finished(show)
        }
    }
    var body: some View {
            VStack {
                if show != nil {
                    ShowView(
                        show: show!
                    )
                } else {
                    Text("Loading")
                }
            }.onAppear(perform: {
                loadShow() {
                    show in
                }
            })
    }
}
 
