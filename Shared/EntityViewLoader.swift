//
//  EntityViewModel.swift
//  nPlay
//  Based on code
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import Combine

class EntityViewLoader<T : Entity> : ObservableObject {
    @Published var objectRepository = EntityRepository<T>(path: "")
    @Published var obj : EntityViewModel<T>? = nil;
    private var cancellables: Set<AnyCancellable> = []
    init(path: String) {
        objectRepository = EntityRepository<T>(path: path)
        
    }
    func load() {
        objectRepository.get()
        objectRepository.objects.map {
            obj in
            self.obj = EntityViewModel<T>(obj: obj)
        }
    }
}
