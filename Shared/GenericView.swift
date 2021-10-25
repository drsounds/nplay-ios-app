//
//  GenericView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-25.
//

import SwiftUI

struct GenericView<Content : View>: View {
    var color : Color
    var imageUrl : String?
    
    init(color: Color, @ViewBuilder content: @escaping() -> Content) {
        self.color = color
        self.content = content
    }
    init(color: Color, imageUrl: String?, @ViewBuilder content: @escaping() -> Content) {
        self.color = color
        self.imageUrl = imageUrl
        self.content = content
    }
    let content: () -> Content
 
    var body: some View {
        ZStack {
            ZStack {
                if imageUrl != nil {
                    ImageView(url: imageUrl!)
                } else {
                    Rectangle().background(
                        color
                    )
                }
            }.mask(
                LinearGradient(
                    colors: [
                        Color.black.opacity(0.8),
                        Color.black.opacity(0)
                    ],
                    startPoint: .top, endPoint: .center
                )
            )
            ScrollView {
                content()
            }
        }
    }
}
 
