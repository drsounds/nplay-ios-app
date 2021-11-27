//
//  StoryletEnclosureView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-22.
//

import SwiftUI

struct StoryletEnclosureView: View {
    var storylet : Storylet
    var body: some View {
        GenericView(color: Color.black) {
            StoryletView(
                storylet: storylet
            )
        }
    }
}
