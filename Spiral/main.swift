//
//  main.swift
//  Spiral
//
//  Created by Matteo Battaglio on 28/02/16.
//  Copyright © 2016 #pragma mark. All rights reserved.
//

public func fill(var grid: Grid) -> Grid {
    // Start from first cell
    var row = 0
    var column = 0
    
    // Start to the right
    enum Direction: Int { case Right, Down, Left, Up }
    var direction: Direction = .Right
    
    var number = 1 // Start from number 1
    while number <= grid.count { // Continue until reach the last number
        // The algorithm differs based on direction
        switch direction {
        case .Right:
            // Continue until reach a just filled cell
            while column < grid.size.columns && grid[row: row, column: column] == 0 {
                // Update the cell and increment number
                grid[row: row, column: column] = number
                number++
                
                // Increment column to the next cell
                column++
            }
            
            // When the row is completed, setup for the next cell and change direction
            row++
            column--
            direction = .Down
        case .Down:
            while row < grid.size.rows && grid[row: row, column: column] == 0 {
                grid[row: row, column: column] = number
                number++
                
                row++
            }
            
            row--
            column--
            direction = .Left
        case .Left:
            while column >= 0 && grid[row: row, column: column] == 0 {
                grid[row: row, column: column] = number
                number++
                
                column--
            }
            
            row--
            column++
            direction = .Up
        case .Up:
            while row >= 0 && grid[row: row, column: column] == 0 {
                grid[row: row, column: column] = number
                number++
                
                row--
            }
            
            row++
            column++
            direction = .Right
        }
    }
    
    return grid
}

// Example

let spiral = fill(Grid(rows: 10, columns: 10))

for (index, number) in spiral.enumerate() {
    let column = index % spiral.size.columns
    
    print("\(number)", terminator: column == spiral.size.columns - 1 ? "\n" : "\t")
}
