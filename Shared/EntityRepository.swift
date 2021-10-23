//
//  ShowRepository.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-10-21.
// Code based on https://www.raywenderlich.com/11609977-getting-started-with-cloud-firestore-and-swiftui
//

// Code based on https://www.raywenderlich.com/11609977-getting-started-with-cloud-firestore-and-swiftui#toc-anchor-008
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class EntityRepository<T : Entity>: ObservableObject {
  @Published var objects : Array<T> = []
  private var path : String = ""
  private let store = Firestore.firestore()
  init(path: String) {
     self.path = path
  }
  func get() {
   store.collection(path)
    .addSnapshotListener { querySnapshot, error in
      // 4
      if let error = error {
          print("Error when retrieving \(self.path): \(error.localizedDescription)")
        return
      }

      // 5
      self.objects = querySnapshot?.documents.compactMap { document in
        // 6
        try? document.data(as: T.self)
      } ?? []
    }
   }
}
