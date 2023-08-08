// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct UserWhereInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: GraphQLNullable<StringFilter> = nil,
    email: GraphQLNullable<StringFilter> = nil
  ) {
    __data = InputDict([
      "id": id,
      "email": email
    ])
  }

  public var id: GraphQLNullable<StringFilter> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var email: GraphQLNullable<StringFilter> {
    get { __data["email"] }
    set { __data["email"] = newValue }
  }
}
