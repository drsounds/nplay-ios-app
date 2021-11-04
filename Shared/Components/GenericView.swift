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
    var showCircle : Bool = false
    
    init(color: Color, @ViewBuilder content: @escaping() -> Content) {
        self.color = color
        print(color)
        print(imageUrl)
        self.content = content
    }
    init(color: Color, imageUrl: String?, @ViewBuilder content: @escaping() -> Content) {
        self.color = color
        self.imageUrl = imageUrl
        self.content = content
    }
    init(color: Color, imageUrl: String?, height: UnitPoint, @ViewBuilder content: @escaping() -> Content) {
        self.color = color
        self.imageUrl = imageUrl
        self.content = content
        self.height = height
    }
    init(color: Color, imageUrl: String?, height: UnitPoint, showCircle: Bool, @ViewBuilder content: @escaping() -> Content) {
        self.color = color
        print(color)
        self.imageUrl = imageUrl
        self.content = content
        self.showCircle = showCircle
        self.height = height
        print("Show Circle \(showCircle)")
    }
    let content: () -> Content
 
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                if showCircle {
                    Circle()
                        .fill(Color(hex: "#ffffff", alpha: 0.5))
                        .frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.width * 2)
                        .position(x: UIScreen.main.bounds.width / 2, y:  UIScreen.main.bounds.width * -0.5)
                }
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
 
