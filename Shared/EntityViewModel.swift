//
//  EntityViewModel.swift
//  nPlay
//  Based on code https://www.raywenderlich.com/11609977-getting-started-with-cloud-firestore-and-swiftui
//  Created by Alexander Forselius on 2021-10-21.
//

import Foundation
import Combine

class EntityViewModel<T : Entity> : ObservableObject, Identifiable {
    private let repository : EntityRepository<T> = EntityRepository<T>(path: "");
    private var cancellables: Set<AnyCancellable> = [];
    @Published var obj : T;
    init(obj: T) {
        self.obj = obj
    }
}
