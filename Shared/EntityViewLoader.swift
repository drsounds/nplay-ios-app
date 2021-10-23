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
    @Published var obj : T? = nil;
    private var cancellables: Set<AnyCancellable> = []
    init(path: String) {
        objectRepository = DocumentRepository<T>(path: path)
        
    }
    func setPath(_ path: String) {
        objectRepository = DocumentRepository<T>(path: path)
    }
    func get(finished: @escaping (T?) -> Void) {
        objectRepository.get() {
            obj in
            finished(obj)
        }
    }
}
