// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct GreWordWhereUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: GraphQLNullable<String> = nil,
    spelling_userId: GraphQLNullable<GreWordSpellingUserIdCompoundUniqueInput> = nil
  ) {
    __data = InputDict([
      "id": id,
      "spelling_userId": spelling_userId
    ])
  }

  public var id: GraphQLNullable<String> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var spelling_userId: GraphQLNullable<GreWordSpellingUserIdCompoundUniqueInput> {
    get { __data["spelling_userId"] }
    set { __data["spelling_userId"] = newValue }
  }
}
