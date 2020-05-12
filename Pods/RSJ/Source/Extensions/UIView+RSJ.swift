//
//  UIView+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIView
import struct CoreGraphics.CGFloat

public struct RSJViewSpecific {

    // MARK: Stored Propeties
    public let view: UIView

}

public extension RSJViewSpecific {

    func addView(forAutoLayout view: UIView) {
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    func addViews(forAutoLayout views: UIView...) {
        self.addViews(forAutoLayout: views)
    }

    func addViews(forAutoLayout views: [UIView]) {
        views.forEach(self.addView)
    }

    func cornerRadius(of value: CGFloat) {
        self.view.layer.cornerRadius = value
        self.view.layer.backgroundColor = self.view.backgroundColor?.cgColor
    }

}

public extension UIView {

    var rsj: RSJViewSpecific {
        return RSJViewSpecific(view: self)
    }
}
