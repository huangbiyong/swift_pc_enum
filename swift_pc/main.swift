//
//  main.swift
//  swift_pc
//
//  Created by chhu02 on 2019/6/25.
//  Copyright © 2019 chase. All rights reserved.
//

import Foundation

/*

//// 枚举的基本用法
enum Score {
    case a, b, c, d
}
// 等价于
enum Score1 {
    case a
    case b
    case c
    case d
}

var score = Score.a
score = .b
print(score) // b

switch score {
case .a:
    print("优秀")
case .b:
    print("良好")
case .c:
    print("及格")
case .d:
    print("不及格")
}

 */





/*

enum Score {
    case point(Int)
    case grade(Character)
}

var score = Score.point(90)
score = .grade("A")

switch score {
case let .point(s):      // 获取关联值
    print("score = \(s)")
case let .grade(g):      // 获取关联值
    print("core = \(g)")
}


enum Date {
    case digit(year: Int, month: Int, day: Int)
    case string(String)
}

var date = Date.digit(year: 2019, month: 6, day: 25)
date = .string("2019-06-25")

switch date {
case .digit(let year,let month, let day):  // 获取关联值
    print("year = \(year) , month = \(month), day = \(day)")
case .string(let dateStr):  // 获取关联值
    print(dateStr)
}


enum Password {
    case number(Int, Int, Int, Int)
    case gesture(String)
}

var pw = Password.number(2, 4, 6, 8)
pw = .gesture("2468")

switch pw {
//case .number(let n1, let n2, let n3, let n4):
case let .number(n1, n2, n3, n4):  // 或者这样写，两种写法等价
    print("n1 = \(n1), n2 = \(n2), n3 = \(n3), n4 = \(n4)")
case let .gesture(g):
    print("gesture = \(g)")
}

 */





/*
enum Direction: String {
    case east = "东"
    case west = "西"
    case south = "南"
    case north = "北"
}

var direction = Direction.east
print(direction.rawValue)  // 东
direction = .west
print(direction.rawValue)  // 西
 */






/*
enum Direction: String {
    case east = "east"
    case west = "west"
    case south = "south"
    case north = "north"
}

// 等价于
enum Direction: String {
    case east, west, south, north
}

print(Direction.east.rawValue)  // east
print(Direction.west.rawValue)  // west
 */





/*
indirect enum Calculation {
    case number(Int)
    case sum(Calculation, Calculation)
}

// 也可以这样写
//enum Calculation {
//    case number(Int)
//    indirect case sum(Calculation, Calculation)
//}

let five = Calculation.number(5)
let four = Calculation.number(4)
let sum = Calculation.sum(five, four)

func calculation(_ cal: Calculation) -> Int {
    switch cal {
    case let .number(value):
        return value
    case let .sum(cal1, cal2):
        return calculation(cal1) + calculation(cal2)
    }
}

print("sum = \( calculation(sum) )")  // 9
 */






enum Date {
    case digit(year: Int, month: Int, day: Int)
    case other
}

print( MemoryLayout<Date>.size )      // 实际占用的内存大小  25 = 3 * 8 + 1   三个整形（每个占用8个字节） + 1个字节（other占用1个字节）
print( MemoryLayout<Date>.stride )    // 系统分配的内存  32 = 4 * 内存对齐参数
print( MemoryLayout<Date>.alignment ) // 内存对齐参数  8


//let date = Date.digit(year: 2019, month: 6, day: 25)
//print( MemoryLayout.size(ofValue: date) )      // 25
//print( MemoryLayout.stride(ofValue: date) )    // 32
//print( MemoryLayout.alignment(ofValue: date) ) // 8

let date = Date.other
print( MemoryLayout.size(ofValue: date) )      // 25
print( MemoryLayout.stride(ofValue: date) )    // 32
print( MemoryLayout.alignment(ofValue: date) ) // 8
