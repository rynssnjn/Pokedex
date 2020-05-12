//
//  String+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class Foundation.NSString
import class Foundation.NSRegularExpression
import struct Foundation.Data
import struct Foundation.NSRange
import class Foundation.NSTextCheckingResult
import struct CoreGraphics.CGFloat

public struct RSJStringSpecific {

    // MARK: Stored Propeties
    public let string: String

}

public extension RSJStringSpecific {
    var containsNumbers: Bool {
        let regex: String = "[0-9]+"
        let range: Range<String.Index>? = self.string.range(of: regex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    var isAlphabetic: Bool {
        let regex: String = "^[a-zA-Z]+$"
        let range: Range<String.Index>? = self.string.range(of: regex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    var isValidEmail: Bool {
        let regex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let range: Range<String.Index>? = self.string.range(of: regex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    var isValidPhoneNum: Bool {
        let regex: String = "^[0-9]{3}-[0-9]{3}-[0-9]{4}$"
        let range: Range<String.Index>? = self.string.range(of: regex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    var base64Encoded: String? {
        let encodedData: Data? = self.string.data(using: String.Encoding.utf8)
        return encodedData?.base64EncodedString()
    }

    var base64Decoded: String? {
        let base64Regex: String = "^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{4}|[A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)$"
        let range: Range<String.Index>? = self.string.range(of: base64Regex, options: NSString.CompareOptions.regularExpression)
        if range != nil {
            guard
                let decodedData = Data(base64Encoded: self.string),
                let decodedString = String(data: decodedData, encoding: String.Encoding.utf8)
            else { return nil }

            return decodedString
        } else {
            return nil
        }
    }

    var asAscii: String? {
        let regexPattern: String = "(0x)?([0-9a-f]{2})"

        do {

            let regex: NSRegularExpression = try NSRegularExpression(
                pattern: regexPattern,
                options: NSRegularExpression.Options.caseInsensitive
            )

            let nsString: NSString = self.string as NSString
            let characters: [Character] = regex
                .matches(in: self.string, options: [], range: NSRange(location: 0, length: nsString.length)).lazy
                .compactMap { UInt32(nsString.substring(with: $0.range(at: 2)), radix: 16) }
                .compactMap(UnicodeScalar.init)
                .compactMap(Character.init)

            switch characters.isEmpty {
                case true:
                    return nil

                case false:
                    return String(characters)
            }

        } catch {
            print(error)
            return nil
        }
    }

    var isHexValue: Bool {
        let regexPattern: String = "[0-9A-F]+"
        let range = self.string.range(of: regexPattern, options: NSString.CompareOptions.regularExpression)
        return range != nil
    }

    var asHex: String? {
        guard let data = self.string.data(using: String.Encoding.utf8) else { return nil }
        return data.map { String(format: "%02hhx", $0) }.joined()
    }

    var asInt: Int? {
        guard let intValue = Int(self.string) else { return nil }
        return intValue
    }

    var asDouble: Double? {
        guard let doubleValue = Double(self.string) else { return nil }
        return doubleValue
    }

    var asFloat: Float? {
        guard let floatValue = Float(self.string) else { return nil }
        return floatValue
    }

    var asCGFloat: CGFloat? {
        guard let doubleValue = self.asDouble else { return nil }
        return CGFloat(doubleValue)
    }

}

public extension String {

    var rsj: RSJStringSpecific {
        return RSJStringSpecific(string: self)
    }
}
