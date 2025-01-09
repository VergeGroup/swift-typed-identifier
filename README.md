# Typed Identifier

```swift
struct MyIdentifiable: TypedIdentifiable {
  var id: ObjectIdentifier

  typealias TypedIdentifierRawValue = String
  
  var typedID: TypedID {
    .init("A")
  }
}
```
