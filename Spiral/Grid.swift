//
//  Grid.swift
//  Spiral
//
//  Created by Matteo Battaglio on 28/02/16.
//  Copyright © 2016 #pragma mark. All rights reserved.
//

public struct Grid {
    
    private var cells: [Int]
    
    public let size: (rows: Int, columns: Int)
    
    public var count: Int {
        return size.rows * size.columns
    }
    
    public init(rows: Int, columns: Int) {
        size = (rows, columns)
        cells = [Int](count: rows * columns, repeatedValue: 0)
    }
    
    public subscript(row row: Int, column column: Int) -> Int {
        get {
            return cells[index(row, column)]
        }
        set {
            cells[index(row, column)] = newValue
        }
    }
    
    public subscript(index index: Int) -> Int {
        get {
            return cells[index]
        }
        set {
            cells[index] = newValue
        }
    }
    
    private func index(row: Int, _ column: Int) -> Int {
        return row * size.columns + column
    }
    
}

extension Grid: SequenceType {
    
    public func generate() -> AnyGenerator<Int> {
        var index = 0
        return anyGenerator {
            guard index < self.count else {
                return nil
            }
            defer {
                index += 1
            }
            return self[index: index]
        }
    }

}
