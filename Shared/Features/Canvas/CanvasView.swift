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
            if canvasObject.name != nil {
                Text(canvasObject.name!)
            }
            if canvasObject.description != nil {
                Text(canvasObject.description!)
            }
            ForEach(canvasObject.objects) {
                
            }
        }
    }
}
