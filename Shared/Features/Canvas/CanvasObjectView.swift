//
//  CanvasObjectView.swift
//  nPlay (iOS)
//
//  Created by Alexander Forselius on 2021-11-17.
//

import SwiftUI

struct CanvasObjectView: View {
    var canvasObject : CanvasObject
    var body: some View {
        VStack {
            
            if canvasObject.type == "text" {
                if (canvasObject.name != nil) {
                    Text(canvasObject.name!)
                } else {
                    Text("")
                }
                if (canvasObject.description != nil) {
                    Text(canvasObject.description!).opacity(0.8)
                } else {
                    Text("")
                }
            } else if canvasObject.type == "image" {
                if (canvasObject.imageUrl != nil) {
                    ImageView(url: canvasObject.imageUrl!)
                } else {
                    Text("")
                }
                if (canvasObject.name != nil) {
                    Text(canvasObject.name!)
                } else {
                    Text("")
                }
                if (canvasObject.description != nil) {
                    Text(canvasObject.description!).opacity(0.8)
                } else {
                    Text("")
                }
            } else if canvasObject.type == "blurb" {
                BlurbView(
                    name: canvasObject.name ?? "",
                    description: canvasObject.description ?? "",
                    label: "",
                    type: canvasObject.subType ?? "",
                    color: canvasObject.color ?? "",
                    imageUrl: canvasObject.imageUrl ?? ""
                )
            } else if canvasObject.type == "carousel" {
                 
            } 
        }
    }
}
