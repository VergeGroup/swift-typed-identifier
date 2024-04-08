public struct EntityIdentifier<Entity: EntityType> : Hashable, CustomStringConvertible, Sendable {

  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.raw == rhs.raw
  }

  public func hash(into hasher: inout Hasher) {
    raw.hash(into: &hasher)
  }

  public let raw: Entity.EntityIDRawType

  public init(_ raw: Entity.EntityIDRawType) {
    self.raw = raw
  }

  public var description: String {
    "<\(String(reflecting: Entity.self))>(\(raw))"
  }
}

/// A protocol describes object is an Entity.
public protocol EntityType: Equatable, Sendable {

  associatedtype EntityIDRawType: Hashable, Sendable

  var entityID: EntityID { get }

  typealias EntityID = EntityIdentifier<Self>
}
