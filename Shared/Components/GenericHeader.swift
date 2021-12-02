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
            Spacer(minLength: 220)
            if (imageUrl != nil) {
                HStack {
                    ImageView(url: imageUrl!).aspectRatio(1/1, contentMode: .fill).frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width - 60, minHeight: 0, maxHeight: .infinity).shadow(color: Color(hex: "#000000", alpha: 0.2), radius: 7, x: 0, y: 5)
                }
            } else {
                Spacer(minLength: 70)
            }
            if title != nil {
                Text(title!).font(.custom("PlusJakartaSans-ExtraBold", size: 30))
            }
        }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: .infinity).padding(5)
    }
}
 
