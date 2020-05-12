//
//  UIColor+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIColor
import struct CoreGraphics.CGFloat
import class Foundation.Scanner
import struct Foundation.CharacterSet

public struct RSJColorSpecific {

    // MARK: Instance Methods
    public func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat? = nil) -> UIColor {
        let red: CGFloat = red / 255.0
        let green: CGFloat = green / 255.0
        let blue: CGFloat = blue / 255.0
        let alpha: CGFloat = alpha == nil ? 1.0 : alpha!
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    public func color(hexValue: String) -> UIColor {
        var hexValue: String = hexValue.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }

        var rgbValue: UInt32 = 0
        Scanner(string: hexValue).scanHexInt32(&rgbValue)

        switch hexValue.count {
            case 6:
                return UIColor(
                    red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                    blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                    alpha: 1.0
                )
            case 8:
                return UIColor(
                    red: CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0,
                    green: CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0,
                    blue: CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0,
                    alpha: CGFloat(rgbValue & 0x000000FF) / 255.0
                )

            default:
                return UIColor.black
        }
    }

}

public extension UIColor {

    static var rsj: RSJColorSpecific {
        return RSJColorSpecific()
    }

}
