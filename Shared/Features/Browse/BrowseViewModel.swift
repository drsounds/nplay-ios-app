//
//  BrowseViewModel.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-20.
//

import Foundation

class BrowseViewModel : ObservableObject {
    var uri : String = ""
    @Published var status : Int = 100
    @Published var canvasObject : CanvasObject? = nil
    var stadius : StadiusService
    init() {
        self.stadius = StadiusService()
    }
    func loadUri(uriString: String) {
        self.stadius.loadStadiusPage(uriString: uriString, finished: {
            result in
            switch (result) {
            case .success(let canvasObject):
                self.canvasObject = canvasObject
                break;
            case .failure(let error):
                break
            }
        })
    }
}
