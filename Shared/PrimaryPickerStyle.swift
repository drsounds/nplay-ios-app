//
//  PrimaryButton.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct PrimaryPickerStyle: BnStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(UIColor.white))
            .foregroundColor(Color(UIColor.black))
            .clipShape(Capsule())
    }
}
