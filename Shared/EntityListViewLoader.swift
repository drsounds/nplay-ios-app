//
//  EntityViewModel.swift
//  nPlay
//  Based on code
//  Created by Alexander Forselius on 2021-10-21.
//
//  Based on code https://www.raywenderlich.com/11609977-getting-started-with-cloud-firestore-and-swiftui

import Foundation
import Combine

class EntityListViewLoader<T : Entity> : ObservableObject {
    @Published var objectRepository = CollectionRepository<T>(path: "")
    @Published var objectViewModels : [EntityViewModel<T>] = [];
    private var cancellables: Set<AnyCancellable> = []
    init(path: String) {
        objectRepository = CollectionRepository<T>(path: path)
    }
    func setPath(_ path: String) {
        objectRepository = CollectionRepository<T>(path: path)
    }
    func get(_ filter: [String:Any]?, finished: @escaping ([T]) -> Void) {
      objectRepository.get(filter) {
            objects in
            finished(objects)
      }
      objectRepository.$objects.map { cards in
        cards.map(EntityViewModel.init)
      }
      .assign(to: \.objectViewModels, on: self)
      // 3
      .store(in: &cancellables)
    }
}
