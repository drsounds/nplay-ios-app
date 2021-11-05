//
//  StoryPlayerPage.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-02.
//

import SwiftUI

struct StoryletPlayerView: View {
    var storylet : Storylet
    @State var selection : Int = 0
    var body: some View {
        GenericView(color: Color(hex: storylet.color, alpha: 0.5), imageUrl: nil, height: .bottom) {
            TabView(selection: $selection) {
                ForEach(0..<storylet.segments.count) {
                    i in
                    let storySegment = storylet.segments[i]
                    VStack {
                        StorySegmentView(storySegment: storySegment, onBeforeStart: {
                            selection -= 1
                        },onEnd: {
                            selection += 1
                        }, onIndexChanged: {
                            index in
                        }).tag(i).cornerRadius(5).shadow(color: Color.black, radius: 20, x: 0, y: 2)
                    }.padding(50)
                }
            }.tabViewStyle(PageTabViewStyle())
        }
    }
}
