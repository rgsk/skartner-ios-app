// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct GreWordTagListRelationFilter: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    every: GraphQLNullable<GreWordTagWhereInput> = nil,
    some: GraphQLNullable<GreWordTagWhereInput> = nil,
    none: GraphQLNullable<GreWordTagWhereInput> = nil
  ) {
    __data = InputDict([
      "every": every,
      "some": some,
      "none": none
    ])
  }

  public var every: GraphQLNullable<GreWordTagWhereInput> {
    get { __data["every"] }
    set { __data["every"] = newValue }
  }

  public var some: GraphQLNullable<GreWordTagWhereInput> {
    get { __data["some"] }
    set { __data["some"] = newValue }
  }

  public var none: GraphQLNullable<GreWordTagWhereInput> {
    get { __data["none"] }
    set { __data["none"] = newValue }
  }
}
