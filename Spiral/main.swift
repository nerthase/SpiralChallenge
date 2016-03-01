//
//  main.swift
//  Spiral
//
//  Created by Matteo Battaglio on 28/02/16.
//  Copyright © 2016 #pragma mark. All rights reserved.
//

public func fill(var grid: Grid) -> Grid {
    
}


// Example

let spiral = fill(Grid(rows: 10, columns: 10))

for (index, number) in spiral.enumerate() {
    let column = index % spiral.size.columns
    
    print("\(number)", terminator: column == spiral.size.columns - 1 ? "\n" : "\t")
}
