//
//  RSJActivityIndicatorView.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIActivityIndicatorView

open class RSJActivityIndicatorView: UIActivityIndicatorView, RSJDebuggable {
    deinit {
        self.log()
    }
}
