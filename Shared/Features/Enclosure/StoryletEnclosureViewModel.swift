//
//  EpisodePlayerViewModel.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-22.
//

import Foundation

class StoryletEnclosureViewModel : ObservableObject {
    @Published var enclosure : Enclosure? = nil
    @Published var storylet: Storylet? = nil
    @Published var status : Int = 100
    var stadiusService : StadiusService = StadiusService()
    func loadStorylet(_ uriString: String) {
        self.stadiusService.getStoryletFromUri(uriString, finished: {
            result in
            DispatchQueue.main.async {
                switch(result) {
                case .success(let storylet):
                    self.storylet = storylet
                    self.status = 200
                case .failure(_):
                    self.status = 500
                }
            }
        })
    }
}
