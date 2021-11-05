//
//  StoryletService.swift
//  nPlay
//
//  Created by Alexander Forselius on 2021-11-05.
//

import Foundation

class StoryletService {
    // Code based on https://programmingwithswift.com/parse-json-from-file-and-url-with-swift/
  private func parseStorylet(jsonData: Data) -> Storylet? {
        do {
            let decodedData : Storylet = try JSONDecoder().decode(Storylet.self,
                                                       from: jsonData)
            return decodedData;
        } catch {
            return nil
        }
    }
    // Code from https://programmingwithswift.com/parse-json-from-file-and-url-with-swift/
  func loadStorylet(_ urlString: String, success: @escaping (Storylet) -> Void, failure: @escaping  (Error?) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    failure(error)
                }
                
                if let data = data {
                    guard let storylet : Storylet = self.parseStorylet(jsonData: data) else {
                        failure(nil)
                        return
                    }
                    success(storylet)
                }
            }
            
            urlSession.resume()
        }
        
    }
}
