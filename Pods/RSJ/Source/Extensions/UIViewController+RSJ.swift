//
//  UIViewController+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIView
import class UIKit.UIViewController
import class UIKit.UIActivityIndicatorView
import class UIKit.UINavigationItem
import class UIKit.UIControl
import class UIKit.UISegmentedControl
import class UIKit.UIDatePicker
import class UIKit.UIRefreshControl
import class UIKit.UISwitch
import struct UIKit.Selector
import class UIKit.NSLayoutConstraint
import struct CoreGraphics.CGSize
import class Foundation.DispatchQueue

public struct RSJViewControllerSpecific {

    // MARK: Stored Propeties
    public let vc: UIViewController

}

public extension RSJViewControllerSpecific {

    func add(child vc: UIViewController) {
        self.vc.addChild(vc)
        vc.didMove(toParent: self.vc)
        self.vc.view.addSubview(vc.view)
    }

    func remove(child vc: UIViewController) {
        guard vc.parent === self.vc else { return }

        vc.willMove(toParent: nil)
        vc.removeFromParent()
        vc.view.removeFromSuperview()
    }

    func setUpNavigationItem(_ item: (UINavigationItem) -> Void) {
        item(self.vc.navigationItem)
    }

    func setUpTargetActions(with dictionary: [UIControl: Selector]) {

        for (control, action) in dictionary {

            let controlEvent: UIControl.Event

            switch control {
                case is UISegmentedControl, is UIDatePicker, is UIRefreshControl, is UISwitch:
                    controlEvent = UIControl.Event.valueChanged

                default:
                    controlEvent = UIControl.Event.touchUpInside
            }

            control.addTarget(self.vc, action: action, for: controlEvent)
        }
    }

    private func createActivityIndicator(with size: CGSize) -> RSJActivityIndicatorView {
        let view: RSJActivityIndicatorView = RSJActivityIndicatorView()
        view.style = UIActivityIndicatorView.Style.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        view.rsj.cornerRadius(of: 5.0)

        self.vc.view.addSubview(view)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: self.vc.view.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.vc.view.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: size.height),
            view.widthAnchor.constraint(equalToConstant: size.width)
        ])
        return view
    }

    private func findActivityIndicator() -> RSJActivityIndicatorView? {
        return self.vc.view.subviews.reversed()
            .first(where: { (view: UIView) -> Bool in view is RSJActivityIndicatorView }) as? RSJActivityIndicatorView
    }

    func showActivityIndicator(with size: CGSize = CGSize(width: 60.0, height: 60.0)) {
        DispatchQueue.main.async { () -> Void in
            self.createActivityIndicator(with: size)
                .startAnimating()

            self.vc.view.isUserInteractionEnabled = false
        }
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async { () -> Void in
            guard let view = self.findActivityIndicator() else { return }

            view.stopAnimating()
            view.removeFromSuperview()
            self.vc.view.isUserInteractionEnabled = true
        }
    }

}

public extension UIViewController {

    var rsj: RSJViewControllerSpecific {
        return RSJViewControllerSpecific(vc: self)
    }
}
