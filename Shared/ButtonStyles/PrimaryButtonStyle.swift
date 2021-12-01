//
//  PrimaryButton.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 10, leading: 60, bottom: 10, trailing: 60))
            .font(Font.custom("PlusJakartaSans-ExtraBold", size: 16))
            .background(
                LinearGradient(
                    colors: [.accentColor, .accentColor.opacity(0.7)],
                    startPoint: UnitPoint(x:0, y: 0),
                    endPoint:  UnitPoint(x:0, y: 1)
                )
            )
            .foregroundColor(Color(UIColor.white))
            .clipShape(Capsule())
    }
}
