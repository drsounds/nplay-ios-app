//
//  ShowView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct ShowView: View {
    var show : Show
    var body: some View {
        ScrollView {
            VStack {
                GenericHeader(
                    title: show.name,
                    label: "show",
                    imageUrl: ""
                )
                Button("Subscribe") {
                    print("Subscribed")
                }.buttonStyle(PrimaryButton())
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
            )
        )
    }
}
