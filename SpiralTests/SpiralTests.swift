//
//  SpiralTests.swift
//  SpiralTests
//
//  Created by Matteo Battaglio on 28/02/16.
//  Copyright © 2016 #pragma mark. All rights reserved.
//

import XCTest
import Spiral

class SpiralTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test1x1() {
        let grid = Grid(rows: 1, columns: 1)
        
        let spiral = fill(grid)
        
        XCTAssertEqual(spiral.count, grid.count)
        
        XCTAssertEqual(spiral[index: 0], 1)
    }
    
    func test1x10() {
        let grid = Grid(rows: 1, columns: 10)
        
        let spiral = fill(grid)
        
        XCTAssertEqual(spiral.count, grid.count)
        
        for i in 0..<10 {
            XCTAssertEqual(spiral[index: i], 1 + i)
        }
    }
    
    func test10x1() {
        let grid = Grid(rows: 10, columns: 1)
        
        let spiral = fill(grid)
        
        XCTAssertEqual(spiral.count, grid.count)
        
        for i in 0..<10 {
            XCTAssertEqual(spiral[row: i, column: 0], 1 + i)
        }
    }
    
    func test10x10() {
        let grid = Grid(rows: 10, columns: 10)
        
        let spiral = fill(grid)
        
        XCTAssertEqual(spiral.count, grid.count)
        
        for i in 0..<10 {
            XCTAssertEqual(spiral[row: 9, column: i], 28 - i)
        }
        
        for i in 3..<7 {
            XCTAssertEqual(spiral[row: i, column: 6], 85 + i)
        }
        
        XCTAssertEqual(spiral[row: 5, column: 4], 100)
    }
    
}
