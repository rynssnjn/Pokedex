//
//  Cyanic
//  Created by Julio Miguel Alorro on 14.02.19.
//  Licensed under the MIT license. See LICENSE file
//

import LayoutKit
import UIKit

/**
 The StaticSpacingComponentLayout is a ComponentLayout that is a subclass of SizeLayout<UIView>.
 Used to create, size, and arrange the subviews associated with StaticSpacingComponent.
*/
public final class StaticSpacingComponentLayout: SizeLayout<UIView>, ComponentLayout {

    /**
     Initializer.
     - Parameters:
        - component: The StaticSpacingComponent whose properties define the UI characters of the subviews to be created.
    */
    public init(component: StaticSpacingComponent) {
        let size: CGSize = component.size
        super.init(
            minWidth: size.width,
            maxWidth: size.width,
            minHeight: size.height,
            maxHeight: size.height,
            alignment: Alignment.center,
            flexibility: Flexibility.inflexible,
            viewReuseId: StaticSpacingComponentLayout.identifier,
            sublayout: nil,
            config: { (view: UIView) -> Void in
                view.backgroundColor = component.backgroundColor
            }
        )
    }
}
