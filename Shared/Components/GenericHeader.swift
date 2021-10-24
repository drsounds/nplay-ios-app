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
        ZStack(alignment: .top) {
            Circle()
                .fill(Color(hex: "#ffffff", alpha: 0.1))
                .frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.width * 2)
                .position(x: UIScreen.main.bounds.width / 2, y:  UIScreen.main.bounds.width * -0.5)
            VStack(alignment: .leading, spacing: 10) {
                Text(title).font(.system(size: 60, weight: .bold))
                ImageView(url: imageUrl)
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 5, alignment: .top)
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
