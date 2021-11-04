//
//  ShowView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-23.
//

import SwiftUI

struct ShowView: View {
    var show : Show
     
    init(show: Show) {
        self.show = show
    }
    var body: some View {

        GenericHeader(
            title: show.name,
            label: "show",
            imageUrl: nil
        )
    }
}
  
