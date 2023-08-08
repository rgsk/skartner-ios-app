// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct EnumGreWordStatusFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    equals: GraphQLNullable<GraphQLEnum<GreWordStatus>> = nil,
    `in`: GraphQLNullable<[GraphQLEnum<GreWordStatus>]> = nil,
    notIn: GraphQLNullable<[GraphQLEnum<GreWordStatus>]> = nil,
    not: GraphQLNullable<GraphQLEnum<GreWordStatus>> = nil
  ) {
    __data = InputDict([
      "equals": equals,
      "in": `in`,
      "notIn": notIn,
      "not": not
    ])
  }

  public var equals: GraphQLNullable<GraphQLEnum<GreWordStatus>> {
    get { __data["equals"] }
    set { __data["equals"] = newValue }
  }

  public var `in`: GraphQLNullable<[GraphQLEnum<GreWordStatus>]> {
    get { __data["in"] }
    set { __data["in"] = newValue }
  }

  public var notIn: GraphQLNullable<[GraphQLEnum<GreWordStatus>]> {
    get { __data["notIn"] }
    set { __data["notIn"] = newValue }
  }

  public var not: GraphQLNullable<GraphQLEnum<GreWordStatus>> {
    get { __data["not"] }
    set { __data["not"] = newValue }
  }
}
