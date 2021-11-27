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
  func loadStorylet(_ urlString: String, finished: @escaping (Result<Storylet, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    finished(.failure(error))
                }
                
                if let data = data {
                    guard let storylet : Storylet = self.parseStorylet(jsonData: data) else {
                        finished(.failure(NSError("Could not read storylet")))
                        return
                    }
                    finished(.success(storylet))
                }
            }
            
            urlSession.resume()
        }
        
    }
}
