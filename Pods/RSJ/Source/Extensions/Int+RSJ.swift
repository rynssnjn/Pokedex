//
//  Int+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import struct CoreGraphics.CGFloat

public struct RSJIntSpecific {

    // MARK: Stored Propeties
    public let int: Int

}

public extension RSJIntSpecific {

    var asString: String {
        return "\(self.int)"
    }

    var asDouble: Double {
        return Double(self.int)
    }

    var asFloat: Float {
        return Float(self.int)
    }

    var asCGFloat: CGFloat {
        return CGFloat(self.int)
    }
}

public extension Int {

    var rsj: RSJIntSpecific {
        return RSJIntSpecific(int: self)
    }
}
