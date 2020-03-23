//
//  Cyanic
//  Created by Julio Miguel Alorro on 14.02.19.
//  Licensed under the MIT license. See LICENSE file
//

import LayoutKit
import UIKit

// sourcery: AutoGenerateComponent,AutoGenerateComponentExtension
// sourcery: ComponentLayout = StaticTextComponentLayout
/// StaticTextComponent is a Component that represents static text to be displayed in a UICollectionViewCell.
public struct StaticTextComponent: StaticTextComponentType {

// sourcery:inline:auto:StaticTextComponent.AutoGenerateComponent
    /**
     Work around Initializer because memberwise initializers are all or nothing
     - Parameters:
         - id: The unique identifier of the StaticTextComponent.
    */
    public init(id: String) {
        self.id = id
    }

    public var id: String

    public var width: CGFloat = 0.0

    public var text: Text = Text.unattributed("")

    public var font: UIFont = UIFont.systemFont(ofSize: 13.0)

    public var backgroundColor: UIColor = UIColor.clear

    public var lineFragmentPadding: CGFloat = 0.0

    // sourcery: skipHashing, skipEquality
    public var insets: UIEdgeInsets = UIEdgeInsets.zero

    // sourcery: skipHashing, skipEquality
    public var alignment: Alignment = Alignment.centerLeading

    // sourcery: skipHashing, skipEquality
    public var flexibility: Flexibility = TextViewLayoutDefaults.defaultFlexibility

    // sourcery: skipHashing, skipEquality
    public var configuration: (UITextView) -> Void = { _ in }

    // sourcery: skipHashing, skipEquality
    public var layout: ComponentLayout { return StaticTextComponentLayout(component: self) }

    public var identity: StaticTextComponent { return self }
// sourcery:end
}
