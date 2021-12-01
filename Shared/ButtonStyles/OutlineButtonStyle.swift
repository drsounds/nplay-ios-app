//
//  DefaultButtonStyle.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-12-01.
//

import SwiftUI

struct OutlineButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 10, leading: 60, bottom: 10, trailing: 60))
            .font(Font.custom("PlusJakartaSans-ExtraBold", size: 16))
            .clipShape(Capsule())
            .overlay(
                Capsule(style: .continuous)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 3))
            )
        
    }
}
