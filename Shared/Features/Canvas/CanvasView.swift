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
        VStack(alignment: .leading, spacing: 2) {
            Heading(
                name: canvasObject.name,
                description: canvasObject.description
            )
            ForEach(canvasObject.objects!) {
                CanvasObjectView(
                    canvasObject: $0
                )
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
