//
//  RSJView.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIView

open class RSJView: UIView, RSJDebuggable {
    deinit {
        self.log()
    }
}

public extension RSJDebuggable where Self: UIView {

    func log() {
        print("\(type(of: self)) deallocated")
    }

}
