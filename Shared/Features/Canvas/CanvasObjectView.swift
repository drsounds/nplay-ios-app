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
                Heading(
                    name: canvasObject.name,
                    description: canvasObject.description
                )
            } else if canvasObject.type == "image" {
                if (canvasObject.imageUrl != nil) {
                    ImageView(url: canvasObject.imageUrl!)
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
                Heading(
                    name: canvasObject.name,
                    description: canvasObject.description
                )
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(canvasObject.objects) {
                            obj in
                            if canvasObject.subType == "blurb" {
                                BlurbView(
                                    name: obj.name ?? "",
                                    description: obj.description ?? "",
                                    label: "",
                                    type: obj.subType ?? "",
                                    color: obj.color ?? "",
                                    imageUrl: obj.imageUrl ?? ""
                                )
                            }
                        }
                    }
                }
            } 
        }
    }
}
