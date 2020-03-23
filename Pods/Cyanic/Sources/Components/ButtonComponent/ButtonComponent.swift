//
//  Cyanic
//  Created by Julio Miguel Alorro on 27.02.19.
//  Licensed under the MIT license. See LICENSE file
//

import LayoutKit
import UIKit

// sourcery: AutoGenerateComponent,AutoGenerateComponentExtension
// sourcery: ComponentLayout = ButtonComponentLayout
/// ButtonComponent is a Component that represents a UIButton.
public struct ButtonComponent: ButtonComponentType {

// sourcery:inline:auto:ButtonComponent.AutoGenerateComponent
    /**
     Work around Initializer because memberwise initializers are all or nothing
     - Parameters:
         - id: The unique identifier of the ButtonComponent.
    */
    public init(id: String) {
        self.id = id
    }

    public var type: ButtonLayoutType = ButtonLayoutType.system

    public var title: String = ""

    public var font: UIFont = UIFont.systemFont(ofSize: 15.0)

    // sourcery: skipHashing, skipEquality
    public var insets: UIEdgeInsets = UIEdgeInsets.zero

    public var backgroundColor: UIColor = UIColor.clear

    // sourcery: skipHashing, skipEquality
    public var alignment: Alignment = ButtonLayoutDefaults.defaultAlignment

    // sourcery: skipHashing, skipEquality
    public var flexibility: Flexibility = ButtonLayoutDefaults.defaultFlexibility

    // sourcery: skipHashing, skipEquality
    public var configuration: (UIButton) -> Void = { _ in }

    // sourcery: skipHashing, skipEquality
    public var onTap: (UIButton) -> Void = { _ in print("Hello World \(#file)") }

    public var id: String

    public var width: CGFloat = 0.0

    public var height: CGFloat = 44.0

    // sourcery: skipHashing, skipEquality
    public var layout: ComponentLayout { return ButtonComponentLayout(component: self) }

    public var identity: ButtonComponent { return self }
// sourcery:end
}
