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
    var height : UnitPoint = .center
    
    init(color: Color, @ViewBuilder content: @escaping() -> Content) {
        self.color = color
        print(color)
        print(imageUrl)
        self.content = content
    }
    init(color: Color, imageUrl: String?, @ViewBuilder content: @escaping() -> Content) {
        self.color = color
        print(color)
        print(imageUrl)
        self.imageUrl = imageUrl
        self.content = content
    }
    init(color: Color, imageUrl: String?, height: UnitPoint, @ViewBuilder content: @escaping() -> Content) {
        self.color = color
        print(color)
        print(imageUrl)
        self.imageUrl = imageUrl
        self.content = content
        self.height = height
    }
    let content: () -> Content
 
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ZStack(alignment: .top) {
                    if imageUrl != nil {
                        ImageView(url: imageUrl!).aspectRatio(contentMode: .fill)
                    } else {
                        Rectangle().fill(
                            color
                        ).frame(minWidth: UIScreen.main.bounds.width, minHeight: UIScreen.main.bounds.height)
                    }
                }.mask(
                    LinearGradient(
                        colors: [
                            Color.black.opacity(0.8),
                            Color.black.opacity(0)
                        ],
                        startPoint: .top, endPoint: height
                    )
                )
                VStack(alignment: .leading, spacing: 0) {
                    content()
                }
            }
        }.ignoresSafeArea(.all)
    }
}
 
