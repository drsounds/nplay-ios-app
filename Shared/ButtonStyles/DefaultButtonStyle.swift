//
//  DefaultButtonStyle.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-12-01.
//

import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 10, leading: 60, bottom: 10, trailing: 60))
            .font(.custom("PlusJakartaSans-ExtraBold", size: 16))
            .background(
                LinearGradient(
                    colors: [.gray, .gray.opacity(0.7)],
                    startPoint: UnitPoint(x:0, y: 0),
                    endPoint:  UnitPoint(x:0, y: 1)
                )
            )
            .foregroundColor(Color(UIColor.white))
            .clipShape(Capsule())
    }
} 
