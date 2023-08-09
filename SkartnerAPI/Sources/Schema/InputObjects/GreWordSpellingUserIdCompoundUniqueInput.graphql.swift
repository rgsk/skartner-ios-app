// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct GreWordSpellingUserIdCompoundUniqueInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    spelling: String,
    userId: String
  ) {
    __data = InputDict([
      "spelling": spelling,
      "userId": userId
    ])
  }

  public var spelling: String {
    get { __data["spelling"] }
    set { __data["spelling"] = newValue }
  }

  public var userId: String {
    get { __data["userId"] }
    set { __data["userId"] = newValue }
  }
}
