//
//  Blurb.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-19.
//

import SwiftUI

struct BlurbView: View {
    var name : String = ""
    var description : String = ""
    var label : String = ""
    var type : String = ""
    var color : String = "#888888"
    var imageUrl: String = ""
    var body: some View {
        HStack(alignment: .top, spacing: 5) {
            VStack() {
                ImageView(url: imageUrl)
                    .aspectRatio(16/9, contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 2.5)
                VStack {
                    if(label.count > 0) {
                        Text(label.uppercased()).opacity(0.2)
                    }
                    if (name.count > 0) {
                        Text(name).bold()
                    }
                    if (description.count > 0 && false) {
                        Text(description.prefix(10)).font(.system(size: 10)).opacity(0.8)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(0)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color.init(hex: color, alpha: 0.5   ),
                            Color.init(hex: color, alpha: 0.0),
                        ]
                    ),
                    startPoint: .top, endPoint: .bottom
                )
            )
        }.frame(maxWidth:.infinity)
    }
}
