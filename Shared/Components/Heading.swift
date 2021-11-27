//
//  Heading.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-20.
//

import SwiftUI

struct Heading: View {
    var name : String?
    var description : String?
    var body: some View {
        VStack {
            if (name != nil) {
                Text(name!).font(.system(size: 28, weight: .bold))
            }
            if (description != nil) {
                Text(description!).opacity(0.5)
            }
        }.padding(13)
    }
}

struct Heading_Previews: PreviewProvider {
    static var previews: some View {
        Heading()
    }
}
