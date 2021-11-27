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
               Text(canvasObject.name!).font(.system(size: 58, weight: .bold)).padding(16)
                ForEach(canvasObject.objects!) {
                    CanvasObjectView(
                        canvasObject: $0
                    )
                }
           } 
    }
}
