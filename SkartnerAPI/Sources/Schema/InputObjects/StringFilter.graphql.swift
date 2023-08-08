// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct StringFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    contains: GraphQLNullable<String> = nil,
    endsWith: GraphQLNullable<String> = nil,
    equals: GraphQLNullable<String> = nil,
    gt: GraphQLNullable<String> = nil,
    gte: GraphQLNullable<String> = nil,
    `in`: GraphQLNullable<[String]> = nil,
    lt: GraphQLNullable<String> = nil,
    lte: GraphQLNullable<String> = nil,
    not: GraphQLNullable<String> = nil,
    notIn: GraphQLNullable<[String]> = nil,
    startsWith: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "contains": contains,
      "endsWith": endsWith,
      "equals": equals,
      "gt": gt,
      "gte": gte,
      "in": `in`,
      "lt": lt,
      "lte": lte,
      "not": not,
      "notIn": notIn,
      "startsWith": startsWith
    ])
  }

  public var contains: GraphQLNullable<String> {
    get { __data["contains"] }
    set { __data["contains"] = newValue }
  }

  public var endsWith: GraphQLNullable<String> {
    get { __data["endsWith"] }
    set { __data["endsWith"] = newValue }
  }

  public var equals: GraphQLNullable<String> {
    get { __data["equals"] }
    set { __data["equals"] = newValue }
  }

  public var gt: GraphQLNullable<String> {
    get { __data["gt"] }
    set { __data["gt"] = newValue }
  }

  public var gte: GraphQLNullable<String> {
    get { __data["gte"] }
    set { __data["gte"] = newValue }
  }

  public var `in`: GraphQLNullable<[String]> {
    get { __data["in"] }
    set { __data["in"] = newValue }
  }

  public var lt: GraphQLNullable<String> {
    get { __data["lt"] }
    set { __data["lt"] = newValue }
  }

  public var lte: GraphQLNullable<String> {
    get { __data["lte"] }
    set { __data["lte"] = newValue }
  }

  public var not: GraphQLNullable<String> {
    get { __data["not"] }
    set { __data["not"] = newValue }
  }

  public var notIn: GraphQLNullable<[String]> {
    get { __data["notIn"] }
    set { __data["notIn"] = newValue }
  }

  public var startsWith: GraphQLNullable<String> {
    get { __data["startsWith"] }
    set { __data["startsWith"] = newValue }
  }
}
