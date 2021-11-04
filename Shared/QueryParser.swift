//
//  QueryParser.swift
//  nPlay
//
//  Based on code by @koenpunt from https://gist.github.com/jackreichert/81a7ce9d0cefd5d1780f
//
extension String {
    var query: [String: String] {
        var results = [String: String]()
        if let pairs = self.components(separatedBy: "&") as [String]?, pairs.count > 0 {
            for pair: String in pairs {
                if let keyValue = pair.components(separatedBy: "=") as [String]? {
                    results.updateValue(keyValue[1], forKey: keyValue[0])
                }
            }
        }
        return results
    }
}
