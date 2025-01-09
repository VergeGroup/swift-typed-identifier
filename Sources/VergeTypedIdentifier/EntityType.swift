//
// Copyright (c) 2019 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

@available(*, deprecated, renamed: "TypedIdentifier")
public typealias EntityIdentifier<Value: TypedIdentifiable> = TypedIdentifier<Value>

public struct TypedIdentifier<Value: TypedIdentifiable> : Hashable, CustomStringConvertible, Sendable {
  
  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.raw == rhs.raw
  }
  
  public func hash(into hasher: inout Hasher) {
    raw.hash(into: &hasher)
  }
  
  public let raw: Value.TypedIdentifierRawValue
  
  public init(_ raw: consuming Value.TypedIdentifierRawValue) {
    self.raw = raw
  }
  
  public var description: String {
    "<\(String(reflecting: Value.self))>(\(raw))"
  }
}

/// A type that has an identifier that stores a meta type of itself.
public protocol TypedIdentifiable: Identifiable {
  
  associatedtype TypedIdentifierRawValue: Hashable, Sendable
    
  var typedID: TypedIdentifier<Self> { get }
  
}
