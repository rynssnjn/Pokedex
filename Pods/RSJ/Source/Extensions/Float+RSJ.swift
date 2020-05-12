//
//  Float+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import struct CoreGraphics.CGFloat

public struct RSJFloatSpecific {

    // MARK: Stored Propeties
    public let float: Float

}

public extension RSJFloatSpecific {

    var asString: String {
        return "\(self.float)"
    }

    var asInt: Int {
        return Int(self.float)
    }

    var asDouble: Double {
        return Double(self.float)
    }

    var asCGFloat: CGFloat {
        return CGFloat(self.float)
    }

}

public extension Float {

    var rsj: RSJFloatSpecific {
        return RSJFloatSpecific(float: self)
    }

}
