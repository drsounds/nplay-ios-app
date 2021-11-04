//
//  CameraStoryCard.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-04.
//

import SwiftUI
import Camera_SwiftUI
import HybridCamera

struct CameraStoryCard: View {
    var url : String
    var hybridCameraView : HybridCamView
    init(url: String) {
        self.url = url
        self.hybridCameraView = CustomCamView()
    }
    var body: some View {
        CameraView(hybridCameraView: hybridCameraView)
    }
}
