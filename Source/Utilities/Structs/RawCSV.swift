//
//  RawCSV.swift
//  Pokedex
//
//  Created by Rael San Juan on 10/11/2019.
//  Copyright © 2019 Rael San Juan. All rights reserved.
//

import Foundation

public struct RawCSV {

    public let headers: [String]
    public var rows: [[String: Any]] = []
    public var columns: [String: [Any]] = [:]

    private static let delimiter: String = ","

    public init(filePath: String?) throws {

        guard let path = filePath else { throw CSVError.invalidFilePath(filePath) }

        do {

            var csvArray: [String] = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                .components(separatedBy: CharacterSet.newlines)
                .filter { $0.isEmpty == false }

            self.headers = csvArray.remove(at: 0).components(separatedBy: RawCSV.delimiter)

            self.headers.forEach {
                self.columns[$0] = []
            }

            csvArray.forEach {

                let rowDataArray: [String] = $0.components(separatedBy: RawCSV.delimiter)
                var row: [String: Any] = [:]

                self.headers.enumerated().forEach { (i: Int, header: String) in

                    row[header] = rowDataArray[i]

                    self.columns[header]?.append(rowDataArray[i])
                }

                self.rows.append(row)
            }
            
        } catch let error {

            throw error

        }
    }
}

