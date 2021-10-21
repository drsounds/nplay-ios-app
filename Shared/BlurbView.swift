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
    var body: some View {
        VStack() {
            ImageView()
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
                        Color(
                            hue: 0,
                            saturation: 0,
                            brightness: 0,
                            opacity: 0.05
                        ),
                        Color(
                            hue: 0,
                            saturation: 0,
                            brightness: 0,
                            opacity: 0.00
                        )
                    ]
                ),
                startPoint: .top, endPoint: .bottom
            )
        )
        .frame(maxWidth:.infinity)
        .cornerRadius(12.0)
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
