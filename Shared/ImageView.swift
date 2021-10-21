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
        Image("").aspectRatio(16/9, contentMode: .fit)
    }
}
