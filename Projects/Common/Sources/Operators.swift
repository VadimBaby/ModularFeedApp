//
//  File.swift
//  MyCommon
//
//  Created by Вадим Мартыненко on 08.06.2025.
//

precedencegroup FunctionApplicationPrecedence {
  associativity: left
  higherThan: BitwiseShiftPrecedence
}

infix operator &>: FunctionApplicationPrecedence

@discardableResult
public func &> <Input>(value: Input, function: (inout Input) throws -> Void) rethrows -> Input {
  var mValue = value
  try function(&mValue)
  return mValue
}
