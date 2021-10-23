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
    @Published var objectRepository = EntityRepository<T>(path: "")
    @Published var objectViewModels : [EntityViewModel<T>] = [];
    private var cancellables: Set<AnyCancellable> = []
    init(path: String) {
        objectRepository = EntityRepository<T>(path: path)
    }
    func load() {
        objectRepository.get()
      objectRepository.$objects.map { cards in
        cards.map(EntityViewModel.init)
      }
      .assign(to: \.objectViewModels, on: self)
      // 3
      .store(in: &cancellables)
    }
}
