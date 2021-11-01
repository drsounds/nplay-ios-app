//
//  GenericHeader.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct GenericHeader: View {
    var title : String? = nil;
    var label : String? = nil;
    var imageUrl : String? = nil; 
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
            Spacer(minLength: 140)
            if (imageUrl != nil) {
                HStack {
                    ImageView(url: imageUrl!).aspectRatio(16/9, contentMode: .fill).frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width - 60, minHeight: 0, maxHeight: .infinity).shadow(color: Color.black
                                                                                                                                                                                             , radius: 7, x: 0, y: 5)
                }
            } else {
                Spacer(minLength: 70)
            }
            if title != nil {
            Text(title!).font(.system(size: 30, weight: .bold))
            }
        }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: .infinity).padding(5)
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
