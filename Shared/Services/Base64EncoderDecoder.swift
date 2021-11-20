//
//  Base64EncoderDecoder.swift
//  nPlay
//
//  Based on code from https://stackoverflow.com/questions/31859185/how-to-convert-a-base64string-to-string-in-swift
//

import Foundation
extension String {
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }

    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
