//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

round(12)
round(12.3)
round(12.5)
round(12.7)
round(12.234)
round(12.25)

roundf(12)
roundf(12.3)
roundf(12.5)
roundf(12.7)
roundf(12.234)
roundf(12.25)

/*
 public func round(_: Double) -> Double
 public func roundf(_: Float) -> Float

 public func lround(_: Double) -> Int
 public func lroundf(_: Float) -> Int
 */

//以上结果证明：round()和roundf()区别仅仅在于，前者可以处理double类型数据，后者只能处理float类型的数据。二者的处返回值均类似整数，但一个是Double,一个是Float类型。其实所有的数据都可以用Double类型表示。

//保留2位小数的四舍五入
round(12.234) //如何得到12.23
round(12.236) //如何得到12.24

round(12.234 * pow(10, 2)) / pow(10, 2) //得到12.23
round(12.236 * pow(10, 2)) / pow(10, 2) //得到12.24
