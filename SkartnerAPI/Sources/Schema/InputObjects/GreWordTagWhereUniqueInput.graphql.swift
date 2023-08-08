// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct GreWordTagWhereUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: GraphQLNullable<String> = nil,
    name: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "id": id,
      "name": name
    ])
  }

  public var id: GraphQLNullable<String> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var name: GraphQLNullable<String> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }
}
