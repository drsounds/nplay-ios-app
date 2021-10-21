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
        VStack(alignment: HorizontalAlignment.center, spacing: 3) {
            ImageView()
            Text(label.uppercased()).opacity(0.5)
            Text(name).bold()
            Text(description).opacity(0.8)
        }
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
