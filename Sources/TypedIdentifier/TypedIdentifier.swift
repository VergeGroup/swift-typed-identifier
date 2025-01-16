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

public struct TypedIdentifier<Type, Identifier: Hashable & Sendable> : Hashable, CustomStringConvertible, Sendable {
  
  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.raw == rhs.raw
  }
  
  public func hash(into hasher: inout Hasher) {
    raw.hash(into: &hasher)
  }
  
  public let raw: Identifier
  
  public init(_ raw: consuming Identifier) {
    self.raw = raw
  }
  
  public var description: String {
    "<\(String(reflecting: Type.self))>(\(raw))"
  }
}

/// A type that has an identifier that stores a meta type of itself.
public protocol TypedIdentifiable: Identifiable {
  
  associatedtype TypedIdentifierRawValue: Hashable, Sendable
    
  typealias TypedID = TypedIdentifier<Self, TypedIdentifierRawValue>
  
  var typedID: TypedIdentifier<Self, TypedIdentifierRawValue> { get }
  
}

extension TypedIdentifiable {
  public var id: TypedID {
    return typedID
  }
}

#if DEBUG

private struct MyIdentifiable: TypedIdentifiable {
  var id: ObjectIdentifier

  typealias TypedIdentifierRawValue = String
  
  var typedID: TypedID {
    .init("A")
  }
}

private func _run(id: MyIdentifiable.TypedID) {
  id.raw
}

#endif
