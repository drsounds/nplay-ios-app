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
        if (index < storySegment.objects!.count) {
            index += 1
            onIndexChanged(index)
        } else {
            onEnd()
        }
    }
    
    func back() {
        if (index > 0) {
            index -= 1
            onIndexChanged(index)
        } else {
            onBeforeStart()
        }
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            if index > -1 && index < storySegment.objects!.count {
                let storyletObject = storySegment.objects![index];
               
                if storyletObject.type == "video" {
                    HTML5StoryCard(storyletObject: storyletObject).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.8)
                } else if storyletObject.type == "camera" {
                    CameraStoryCard(storyletObject: storyletObject).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:  UIScreen.main.bounds.height * 0.8)
                } else if storyletObject.type == "canvas" {
                    CanvasStoryCard(storyletObject: storyletObject).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:  UIScreen.main.bounds.height * 0.8)
                } else if storyletObject.type == "canvas" {
                    HTML5StoryCard(storyletObject: storyletObject).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.8)
                } else if storyletObject.type == "youtube" {
                    YouTubeStoryCard(storyletObject: storyletObject).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.8)
                } else {
                    EmptyView().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                }
            } else {
                EmptyView().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                
            }
            if storySegment.objects! .count > 1 {
                HStack {
                    // Next button
                    Button("<"){
                        back()
                    }.buttonStyle(DefaultButtonStyle()).frame(minWidth: 0, maxWidth: 60, minHeight: 0, maxHeight: 60).background(Color.gray).cornerRadius(50)
                    Spacer()
                    // Back button
                    Button(">") {
                        next()
                    }.buttonStyle(DefaultButtonStyle()).frame(minWidth: 0, maxWidth: 60, minHeight: 0, maxHeight: 60).background(Color.gray).cornerRadius(50)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
        }
    }
}


