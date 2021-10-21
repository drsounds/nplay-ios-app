//
//  EntityViewModel.swift
//  nPlay
//  Based on code
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import Combine

class EntityListViewModel<T : Entity> : ObservableObject {
    @Published var objectRepository = EntityRepository<T>()
    @Published var objectViewModels : [EntityViewModel<T>] = [];
    private var cancellables: Set<AnyCancellable> = []
    init() {
      objectRepository.$objects.map { cards in
        cards.map(EntityViewModel.init)
      }
      .assign(to: \.objectViewModels, on: self)
      // 3
      .store(in: &cancellables)
    }
}
