//
//  GenericHeader.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct GenericHeader: View {
    var title : String = "Title";
    var label : String = "label";
    var imageUrl : String = "";
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(hex: "#ffffff", alpha: 0.2))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .position(x: 0, y: 50)
            VStack {
                Text(title)
                ImageView(url: imageUrl)
            }.padding(20)
        }
    }
}

struct GenericHeader_Previews: PreviewProvider {
    static var previews: some View {
        GenericHeader(
            title: "Test",
            label: "Test"
        )
    }
}
