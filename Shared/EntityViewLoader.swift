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
    @Published var objectRepository = DocumentRepository<T>(path: "")
    @Published var obj : EntityViewModel<T> = EntityViewModel<T>();
    private var cancellables: Set<AnyCancellable> = []
    init(path: String) {
        objectRepository = DocumentRepository<T>(path: path)
        
    }
    func setPath(_ path: String) {
        objectRepository = DocumentRepository<T>(path: path)
    }
    func get() {
        objectRepository.get()
        self.objectRepository.$obj.assign(to: \.obj.obj, on: self)
    }
}
