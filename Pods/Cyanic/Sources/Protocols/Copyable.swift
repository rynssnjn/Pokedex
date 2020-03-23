//
//  Cyanic
//  Created by Julio Miguel Alorro on 01.03.19.
//  Licensed under the MIT license. See LICENSE file
//

/**
 Copyable is a fork of https://gist.github.com/nicklockwood/9b4aac87e7f88c80e932ba3c843252df.
 Used to mutate Components and State in place with a copy (due to the value-type nature of structs)
*/
public protocol Copyable {}

public extension Copyable {
    /**
     Creates a mutable copy of Self and mutates that copy with the closure.
     - Parameters:
        - block: The closure that mutates the mutable copy of Self
        - mutableSelf: The mutable copy of Self passed to the closure.
     - Returns:
        A copy of Self with the changes from the closure.
    */
    func copy(with changes: (_ mutableSelf: inout Self) -> Void) -> Self {
        var mutableSelf: Self = self
        changes(&mutableSelf)
        return mutableSelf
    }
}
