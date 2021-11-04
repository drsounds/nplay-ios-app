//
//  With.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-04.
//

import SwiftUI

struct With<Content : View>: View {
    let content: () -> Content
    init(_ obj: Any, @ViewBuilder content: @escaping (Any) -> Content) {
    }
    var body : some View {
        content()
    }
}

