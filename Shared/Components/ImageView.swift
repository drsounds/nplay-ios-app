//
//  ImageView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-19.
//

import SwiftUI

struct ImageView : View {
    var url: String = ""
    var body: some View {
        AsyncImage(
            url: URL(
                string: url
            )
        ) {  image in
                image.resizable()
        } placeholder: {
            Image("")
        }
    }
}
