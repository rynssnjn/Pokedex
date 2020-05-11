//
//  CGFloat+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import struct CoreGraphics.CGFloat

public struct RSJCGFloatSpecific {

    // MARK: Stored Propeties
    public let cgFloat: CGFloat

}

public extension RSJCGFloatSpecific {

    var asString: String {
        return "\(self.cgFloat)"
    }

    var asInt: Int {
        return Int(self.cgFloat)
    }

    var asDouble: Double {
        return Double(self.cgFloat)
    }

    var asFloat: Float {
        return Float(self.cgFloat)
    }
}

public extension CGFloat {

    var rsj: RSJCGFloatSpecific {
        return RSJCGFloatSpecific(cgFloat: self)
    }

}
