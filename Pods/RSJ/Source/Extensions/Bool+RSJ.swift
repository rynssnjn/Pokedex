//
//  Bool+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

public struct RSJBoolSpecific {

    // MARK: Stored Propeties
    public let bool: Bool

}

public extension RSJBoolSpecific {
    var isTrue: Bool {
        return self.bool == true
    }

    var isFalse: Bool {
        return self.bool == false
    }
}

public extension Bool {

    var rsj: RSJBoolSpecific {
        return RSJBoolSpecific(bool: self)
    }

}
