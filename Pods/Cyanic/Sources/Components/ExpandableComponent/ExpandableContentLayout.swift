//
//  Cyanic
//  Created by Julio Miguel Alorro on 04.03.19.
//  Licensed under the MIT license. See LICENSE file
//

import LayoutKit
import UIKit

open class ExpandableContentLayout: InsetLayout<UIView>, Hashable {
    public static func == (lhs: ExpandableContentLayout, rhs: ExpandableContentLayout) -> Bool {
        return lhs.isEqual(to: rhs)
    }

    /**
     Method used for equality checks.
     - Parameters:
        - other: ExpandableContentLayout instance to be compared with.
     - Returns: Bool
    */
    open func isEqual(to other: ExpandableContentLayout) -> Bool {
        fatalError("Must override this")
    }

    public func hash(into hasher: inout Hasher) {
        fatalError("Must override this")
    }

}

/**
 A Layout for an ExpandableComponent that consists of a single UILabel.
*/
public final class LabelContentLayout: ExpandableContentLayout {

    /**
     Initializer
     - Parameters:
        - text: String / NSAttributedString to be displayed on the UILabel.
        - font: UIFont used for the String. Default value is UIFont.systemFont(ofSize: 17.0)
        - alignment: Alignment. Default value is Alignment.center
        - style: Styling to be applied on the UILabel. Default value is an empty style.
    */
    public init(
        text: Text,
        font: UIFont = UIFont.systemFont(ofSize: 17.0),
        alignment: Alignment = Alignment.center,
        configuration: @escaping (UILabel) -> Void = { _ in }
    ) {

        let labelLayout: LabelLayout<UILabel> = LabelLayout<UILabel>(
            text: text,
            font: font,
            numberOfLines: 0,
            alignment: Alignment.centerLeading,
            flexibility: LabelLayoutDefaults.defaultFlexibility,
            viewReuseId: "\(ExpandableComponentLayout.identifier)ContentLabel",
            config: configuration
        )
        self.text = text
        self.font = font
        super.init(
            insets: UIEdgeInsets.zero,
            alignment: alignment,
            flexibility: labelLayout.flexibility,
            viewReuseId: "\(ExpandableComponentLayout.identifier)ContentInset",
            sublayout: labelLayout,
            config: nil
        )

    }

    /**
     Text of the UILabel
    */
    public let text: Text

    /**
     UIFont of the UILabel
    */
    public let font: UIFont

    public override func isEqual(to other: ExpandableContentLayout) -> Bool {
        guard let other = other as? LabelContentLayout else { return false }
        return self.text == other.text &&
            self.font == other.font
    }

    public override func hash(into hasher: inout Hasher) {
        self.text.hash(into: &hasher)
        self.font.hash(into: &hasher)
    }

}

/**
 A Layout for an ExpandableComponent that consists of a UIImageView and a UILabel.
*/
public final class ImageLabelContentLayout: ExpandableContentLayout {

    /**
     Initializer
     - Parameters:
        - text: String / NSAttributedString to be displayed on the UILabel.
        - font: UIFont used for the String. Default value is UIFont.systemFont(ofSize: 17.0)
        - labelStyle: Styling to be applied on the UILabel. Default value is an empty style.
        - imageSize: The size for the UIImageView. This cannot be zero, otherwise LayoutKit forces a crash.
        - imageAlignment: Alignment. The default value is Aligment.aspectFit.
        - imageStyle: Styling to be applied on the UIImageView. Do not set the image here. It will be done for you. Default value is an empty style.
        - spacing: The spacing between the UILabel and UIImageView.
    */
    public init(
        text: Text,
        font: UIFont = UIFont.systemFont(ofSize: 17.0),
        labelConfiguration: @escaping (UILabel) -> Void = { _ in },
        image: UIImage,
        imageSize: CGSize,
        imageAlignment: Alignment = Alignment.aspectFit,
        imageConfiguration: @escaping (UIImageView) -> Void = { _ in },
        spacing: CGFloat
    ) {

        let labelLayout: LabelLayout<UILabel> = LabelLayout<UILabel>(
            text: text,
            font: font,
            numberOfLines: 0,
            alignment: Alignment.centerLeading,
            flexibility: LabelLayoutDefaults.defaultFlexibility,
            viewReuseId: "\(ExpandableComponentLayout.identifier)ContentLabelWithImage",
            config: labelConfiguration
        )

        let imageLayout: SizeLayout<UIImageView> = SizeLayout<UIImageView>(
            size: imageSize,
            alignment: imageAlignment,
            flexibility: Flexibility.inflexible,
            viewReuseId: "\(ExpandableComponentLayout.identifier)ContentImage",
            config: { (view: UIImageView) -> Void in
                imageConfiguration(view)
                view.image = image
            }
        )

        let stackLayout: StackLayout<UIView> = StackLayout<UIView>(
            axis: Axis.horizontal,
            spacing: spacing,
            distribution: StackLayoutDistribution.fillEqualSpacing,
            alignment: Alignment.center,
            viewReuseId: "\(ExpandableComponentLayout.identifier)ContentStack",
            sublayouts: [imageLayout, labelLayout]
        )

        self.text = text
        self.font = font
        self.image = image
        self.imageSize = imageSize
        self.spacing = spacing

        super.init(
            insets: UIEdgeInsets.zero,
            alignment: Alignment.center,
            flexibility: Flexibility.low,
            viewReuseId: "\(ExpandableComponentLayout.identifier)ContentInset",
            sublayout: stackLayout,
            config: nil
        )
    }

    /**
     Text of the UILabel
    */
    public let text: Text

    /**
     UIFont of the UILabel
    */
    public let font: UIFont

    /**
     UIImage of the UIImageView
    */
    public let image: UIImage

    /**
     CGSize of the UIImageView
    */
    public let imageSize: CGSize

    /**
     Spacing between the UILabel and UIImageView
    */
    public let spacing: CGFloat

    public override func isEqual(to other: ExpandableContentLayout) -> Bool {
        guard let other = other as? ImageLabelContentLayout else { return false }
        return self.text == other.text &&
            self.font == other.font &&
            self.image.isEqual(other.image) &&
            self.imageSize == other.imageSize &&
            self.spacing == other.spacing
    }

    public override func hash(into hasher: inout Hasher) {
        self.text.hash(into: &hasher)
        self.font.hash(into: &hasher)
        self.image.hash(into: &hasher)
        self.imageSize.hash(into: &hasher)
        self.spacing.hash(into: &hasher)
    }

}

internal final class EmptyContentLayout: ExpandableContentLayout {

    internal init() {
        let labelLayout: LabelLayout<UILabel> = LabelLayout<UILabel>(
            text: Text.unattributed("This must be replaced!"),
            font: UIFont.systemFont(ofSize: 17.0),
            numberOfLines: 0,
            alignment: Alignment.centerLeading,
            flexibility: LabelLayoutDefaults.defaultFlexibility,
            viewReuseId: "\(ExpandableComponentLayout.identifier)EmptyLabel",
            config: { _ in }
        )

        super.init(
            insets: UIEdgeInsets.zero,
            alignment: labelLayout.alignment,
            flexibility: labelLayout.flexibility,
            viewReuseId: "\(ExpandableComponentLayout.identifier)ContentInset",
            sublayout: labelLayout,
            config: nil
        )
    }

}
