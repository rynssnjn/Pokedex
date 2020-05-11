//
//  CGRect+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import struct CoreGraphics.CGRect
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGPoint

public struct RSJCGRectSpecific {

    // MARK: Stored Propeties
    public let rect: CGRect

}

public extension RSJCGRectSpecific {

    var bottomLeftPoint: CGPoint {
        return CGPoint(x: self.rect.origin.x, y: self.rect.maxY)
    }

    var bottomRightPoint: CGPoint {
        return CGPoint(x: self.rect.maxX, y: self.rect.maxY)
    }

    var topRightPoint: CGPoint {
        return CGPoint(x: self.rect.maxX, y: self.rect.origin.y)
    }

    var left: CGFloat {
        return self.rect.origin.x
    }

    var right: CGFloat {
        return self.rect.maxX
    }

    var top: CGFloat {
        return self.rect.origin.y
    }

    var bottom: CGFloat {
        return self.rect.maxY
    }

    var center: CGPoint {
        return CGPoint(x: self.rect.midX, y: self.rect.midY)
    }

    var centerX: CGFloat {
        return self.rect.midX
    }

    var centerY: CGFloat {
        return self.rect.midY
    }

}

public extension CGRect {

    var rsj: RSJCGRectSpecific {
        return RSJCGRectSpecific(rect: self)
    }

}
