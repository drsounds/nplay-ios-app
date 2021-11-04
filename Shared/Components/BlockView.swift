//
//  BlockView.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import SwiftUI

struct BlockView<T : Entity, D : View> : View {
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ];
    var items = [T]();
    var title : String = "";
    var destination: (T) -> D
    var body : some View {
        VStack {
            Text(title)
            LazyVGrid(
                columns: columns,
                alignment: HorizontalAlignment.center
            ) {
                ForEach(items, id: \.id) {
                    item in
                    NavigationLink(
                        destination: self.destination(item)
                    ) {
                        BlurbView(
                            name:item.name,
                            description:item.description,
                            color: item.color,
                            imageUrl: item.imageUrl!
                        )
                    }.buttonStyle(.plain)
                }
            }
        }
    }
}

struct BlockView_Previews : PreviewProvider {
    static var previews: some View {
        BlockView<Entity, ShowPage>(items: [
            Entity(id: "1", name:"Test",description:"Test", imageUrl:"http://"),
            Entity(id: "2", name:"Test",description:"Test", imageUrl:"http://"),
            Entity(id: "3", name:"Test",description:"Test", imageUrl:"http://"),
            Entity(id: "4", name:"Test",description:"Test", imageUrl:"http://")
        ], title: "Test", destination: {
            item in ShowPage(id: item.id!)
        })
    }
}