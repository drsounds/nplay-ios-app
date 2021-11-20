//
//  CanvasStoryCard.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-13.
//

import SwiftUI

struct CanvasStoryCard: View {
    var storyletObject : StoryletObject
    var body: some View {
        if (storyletObject.canvasObject != nil) {
            CanvasView(canvasObject: storyletObject.canvasObject!)
        } else {
            Text("No canvas object found")
        }
    }
}
 
