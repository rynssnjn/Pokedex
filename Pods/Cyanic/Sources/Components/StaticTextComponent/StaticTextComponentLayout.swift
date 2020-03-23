//
//  Cyanic
//  Created by Julio Miguel Alorro on 14.02.19.
//  Licensed under the MIT license. See LICENSE file
//

import LayoutKit
import UIKit

/**
 The StaticTextComponentLayout is a ComponentLayout that is a subclass of SizeLayout<UIView>.
 Used to create, size, and arrange the subviews associated with StaticTextComponent.
*/
public final class StaticTextComponentLayout: SizeLayout<UIView>, ComponentLayout {

    /**
     Initializer.
     - Parameters:
        - component: The StaticTextComponent whose properties define the UI characters of the subviews to be created.
    */
    public init(component: StaticTextComponent) {
        let textLayout: TextViewLayout<UITextView> = TextViewLayout<UITextView>(
            text: component.text,
            font: component.font,
            lineFragmentPadding: component.lineFragmentPadding,
            textContainerInset: component.insets,
            layoutAlignment: component.alignment,
            flexibility: component.flexibility,
            viewReuseId: "\(StaticTextComponentLayout.identifier)TextView",
            config: { (view: UITextView) -> Void in
                view.backgroundColor = UIColor.clear
                view.isEditable = false
                view.isScrollEnabled = false
                component.configuration(view)
            }
        )

        let size: CGSize = CGSize(width: component.width, height: CGFloat.greatestFiniteMagnitude)

        super.init(
            minWidth: size.width,
            maxWidth: size.width,
            minHeight: 0.0,
            maxHeight: size.height,
            viewReuseId: "\(StaticTextComponentLayout.identifier)Size",
            sublayout: textLayout,
            config: {
                $0.backgroundColor = component.backgroundColor
            }
        )
    }
}
