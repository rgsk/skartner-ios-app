// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct GreWordTagWhereInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: GraphQLNullable<StringFilter> = nil,
    name: GraphQLNullable<StringFilter> = nil,
    userId: GraphQLNullable<StringFilter> = nil
  ) {
    __data = InputDict([
      "id": id,
      "name": name,
      "userId": userId
    ])
  }

  public var id: GraphQLNullable<StringFilter> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var name: GraphQLNullable<StringFilter> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var userId: GraphQLNullable<StringFilter> {
    get { __data["userId"] }
    set { __data["userId"] = newValue }
  }
}
