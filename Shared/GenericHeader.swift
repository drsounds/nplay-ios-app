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
       /* VStack(alignment: .trailing) {
            /*Circle()
                .fill(Color(hex: "#ffffff", alpha: 0.1))
                .frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.width * 2)
                .position(x: UIScreen.main.bounds.width / 2, y:  UIScreen.main.bounds.width * -0.5)*/
            VStack(alignment: .center, spacing: 10) {
                ImageView(url: imageUrl)
                Text(title).font(.system(size: 30, weight: .bold))
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3, alignment: .top)*/
        VStack(alignment: .center, spacing: 1) {
            ImageView(url: imageUrl)
            Text(title).font(.system(size: 30, weight: .bold))
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.3)
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
