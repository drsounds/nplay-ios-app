//
//  EpisodePlayer.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-02.
//

import SwiftUI

struct EnclosureView: View {
    var enclosure : Enclosure? = nil
    
    var body: some View {
        if enclosure != nil {
            if enclosure?.contentType == "application/json" {
                StoryletEnclosurePage(uri: "stadius:storylet:\(enclosure!.url.base64Encoded()!)")
            }
        }
    }
}
