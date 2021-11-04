//
//  StorySegmentView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-04.
//

import SwiftUI

struct StorySegmentView: View {
    var storySegment: StorySegment
    var onBeforeStart : () -> Void
    var onEnd : () -> Void
    var onIndexChanged : (Int) -> Void
    @State var index: Int = 0

    func next() {
        if (index < storySegment.objects.count) {
            index += 1
            onIndexChanged(index)
        } else {
            onEnd()
        }
    }
    
    func back() {
        if (index > 0) {
            index += 1
            onIndexChanged(index)
        } else {
            onBeforeStart()
        }
    }
    var body: some View {
        ZStack {
            let storyObject = storySegment.objects[index];
            if storyObject.type == "video" {
                HTML5StoryCard(url: storyObject.url)
            } else if storyObject.type == "camera" {
                CameraStoryCard(url: storyObject.url)
            } else if storyObject.type == "bundle" {
                HTML5StoryCard(url: storyObject.url)
            } else {
                EmptyView()
            }
            // Back button
            EmptyView().position(x: UIScreen.main.bounds.width - 30, y: 0).frame(width: 30, height: UIScreen.main.bounds.height).onTapGesture {
                next()
            }
            // Next button
            EmptyView().position(x: 0, y: 0).frame(width: 30, height: UIScreen.main.bounds.height).onTapGesture {
                next()
            }
        }
    }
}


