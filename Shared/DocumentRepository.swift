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

class DocumentRepository<T : Entity>: ObservableObject {
    @Published var obj : T? = nil
  private var path : String = ""
  private let store = Firestore.firestore()
  init(path: String) {
     self.path = path
  }
    func get(_ finished: @escaping (T?) -> Void) {
   store.document(path)
    .addSnapshotListener { querySnapshot, error in
      if let error = error {
          print("Error when retrieving \(self.path): \(error.localizedDescription)")
        return
      }
        let obj = try! querySnapshot!.data(as: T.self)
        self.obj = obj
        finished(obj)
    }
   }
}
