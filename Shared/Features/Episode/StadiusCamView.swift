//
//  StadiusCamView.swift
//  nPlay
// Code based on https://github.com/eonist/HybridCamera/blob/master/HybridCamera/ui/CustomCamView.swift
//  Created by Alexander Forselius on 2021-11-04.
//

import SwiftUI
import HybridCamera
import ZoomSwitcherKit

class StadiusCamView: HybridCamView {
    /**
        * Creates topbar
        * - Note: Basically overrides the default design
        */
       @objc override open func createTopBar() -> TopBarViewKind {
          with(TopBar(frame: TopBar.rect)) {
             self.addSubview($0)
          }
       }
       /**
        * Creates Record button
        */
       @objc override open func createRecordButton() -> RecordButtonViewKind {
          with(RecordButton(frame: RecordButton.rect)) {
             self.addSubview($0)
          }
       }
       /**
        * Creates zoom switcher
        */
       @objc override open func createZoomSwitcher() -> ZoomSwitcherKind {
          let backCamType: BackCameraType = .backCameraType
          let size = ZoomSwitcher.getSize(backCamType: backCamType)
          let rect = ZoomSwitcher.getRect(size: size) // .init(origin: .zero, size: size
          return with(ZoomSwitcher(frame: rect, backCameraType: backCamType)) {
             $0.buttons[backCamType.defaultLenseIndex].toggle = true // for tripple cam this needs to be .second,
    //         $0.onSwitch = { focalType in
    //            Swift.print("Switched to focalType:  \(focalType)")
    //         }
             self.addSubview($0)
          }
       }
}
