//
//  EntityViewModel.swift
//  nPlay
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import Combine

class EntityViewModel<T : Entity> : ObservableObject, Identifiable { 
    @Published var obj : T?;
    init() {
        
    }
    init(obj: T) {
        self.obj = obj
    }
}
