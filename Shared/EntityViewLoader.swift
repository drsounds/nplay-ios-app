//
//  EntityViewModel.swift
//  nPlay
//  Based on code
//  Created by Alexander Forselius on 2021-10-21.
//
//  Based on code https://www.raywenderlich.com/11609977-getting-started-with-cloud-firestore-and-swiftui

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
        objectRepository.$objects.map {
            objs in
            objs.map {
                obj in
                self.obj = EntityViewModel<T>(obj: obj)
            }
        }
    }
}
