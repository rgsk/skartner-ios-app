// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct GreWordWhereInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: GraphQLNullable<StringFilter> = nil,
    spelling: GraphQLNullable<StringFilter> = nil,
    userId: GraphQLNullable<StringFilter> = nil,
    greWordTags: GraphQLNullable<GreWordTagListRelationFilter> = nil,
    status: GraphQLNullable<EnumGreWordStatusFilter> = nil,
    user: GraphQLNullable<UserWhereInput> = nil
  ) {
    __data = InputDict([
      "id": id,
      "spelling": spelling,
      "userId": userId,
      "greWordTags": greWordTags,
      "status": status,
      "user": user
    ])
  }

  public var id: GraphQLNullable<StringFilter> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var spelling: GraphQLNullable<StringFilter> {
    get { __data["spelling"] }
    set { __data["spelling"] = newValue }
  }

  public var userId: GraphQLNullable<StringFilter> {
    get { __data["userId"] }
    set { __data["userId"] = newValue }
  }

  public var greWordTags: GraphQLNullable<GreWordTagListRelationFilter> {
    get { __data["greWordTags"] }
    set { __data["greWordTags"] = newValue }
  }

  public var status: GraphQLNullable<EnumGreWordStatusFilter> {
    get { __data["status"] }
    set { __data["status"] = newValue }
  }

  public var user: GraphQLNullable<UserWhereInput> {
    get { __data["user"] }
    set { __data["user"] = newValue }
  }
}
