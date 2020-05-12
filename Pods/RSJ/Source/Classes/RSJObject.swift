//
//  RSJObject.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation.NSObject

open class RSJObject: NSObject, RSJDebuggable {
    deinit {
        self.log()
    }
}

public extension RSJDebuggable where Self: NSObject {

    func log() {
        print("\(type(of: self)) deallocated")
    }

}
