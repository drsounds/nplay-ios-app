//
//  CanvasView.swift
//  nPlay (iOS)
//
//  Created by Alexander Forselius on 2021-11-17.
//

import SwiftUI

struct CanvasView: View {
    var canvasObject: CanvasObject
    var body: some View {
        VStack {
            Heading(
                name: canvasObject.name,
                description: canvasObject.description
            )
            ForEach(canvasObject.objects) {
                CanvasObjectView(
                    canvasObject: $0
                )
            }
        }
    }
}
