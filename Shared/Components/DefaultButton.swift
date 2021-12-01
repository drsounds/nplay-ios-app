//
//  PrimaryButton.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-12-01.
//

import SwiftUI

struct DefaultButton: View {
    var title : String = ""
    var click : () -> Void
    var body: some View {
        Button(title.uppercased()) {
            click()
        }.buttonStyle(DefaultButtonStyle())
    }
}
 
