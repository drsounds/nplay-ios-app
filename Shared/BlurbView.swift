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
        VStack() {
            ImageView(url: imageUrl)
                .aspectRatio(16/9, contentMode: .fit)
                    .frame(maxWidth: 300, maxHeight: 300)
            VStack {
                Text(label.uppercased()).opacity(0.2)
                Text(name).bold()
                Text(description).opacity(0.8)
            }
            .frame(maxWidth: .infinity)
            .padding(10)
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
        .frame(maxWidth:.infinity) 
    }
}

struct BlurbView_Previews: PreviewProvider {
    static var previews: some View {
        BlurbView(
            name: "Test",
            description: "Test",
            label: "Label"
        )
    }
}
