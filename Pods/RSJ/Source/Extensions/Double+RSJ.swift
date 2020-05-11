//
//  Double+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import struct CoreGraphics.CGFloat

public struct RSJDoubleSpecific {

    // MARK: Stored Propeties
    public let double: Double

}

public extension RSJDoubleSpecific {

    var asString: String {
        return "\(self.double)"
    }

    var asInt: Int {
        return Int(self.double)
    }

    var asFloat: Float {
        return Float(self.double)
    }

    var asCGFloat: CGFloat {
        return CGFloat(self.double)
    }

}

public extension Double {

    var rsj: RSJDoubleSpecific {
        return RSJDoubleSpecific(double: self)
    }

}
