//
//  DecodingErrorHandling.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

public protocol DecodingErrorHandler {

    func handle(decodingError error: DecodingError) -> Never

}

public extension DecodingErrorHandler {

    func handle(decodingError error: DecodingError) -> Never {
        switch error {
            case .dataCorrupted(let context):
                fatalError(context.debugDescription)

            case .keyNotFound(let key, let context):
                fatalError("KEY NOT FOUND: \(key) \(context.debugDescription)")

            case .typeMismatch(let type, let context):
                fatalError("TYPE MISMATCH: \(type) \(context.debugDescription)")

            case .valueNotFound(let type, let context):
                fatalError("VALUE NOT FOUND: \(type) \(context.debugDescription)")
            @unknown default:
                fatalError("UNKNOWN ERROR")
        }

        print(error)

    }

}
