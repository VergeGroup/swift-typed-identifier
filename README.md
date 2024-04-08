# Typed Identifier

```swift
struct Author: EntityType {

  typealias EntityIDRawType = String

  var entityID: EntityID {
    .init(rawID)
  }

  let rawID: String

  var name: String = ""
}
```
