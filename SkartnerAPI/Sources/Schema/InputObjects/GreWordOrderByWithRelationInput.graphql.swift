// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct GreWordOrderByWithRelationInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    id: GraphQLNullable<GraphQLEnum<SortOrder>> = nil,
    spelling: GraphQLNullable<GraphQLEnum<SortOrder>> = nil,
    createdAt: GraphQLNullable<GraphQLEnum<SortOrder>> = nil,
    updatedAt: GraphQLNullable<GraphQLEnum<SortOrder>> = nil
  ) {
    __data = InputDict([
      "id": id,
      "spelling": spelling,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    ])
  }

  public var id: GraphQLNullable<GraphQLEnum<SortOrder>> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var spelling: GraphQLNullable<GraphQLEnum<SortOrder>> {
    get { __data["spelling"] }
    set { __data["spelling"] = newValue }
  }

  public var createdAt: GraphQLNullable<GraphQLEnum<SortOrder>> {
    get { __data["createdAt"] }
    set { __data["createdAt"] = newValue }
  }

  public var updatedAt: GraphQLNullable<GraphQLEnum<SortOrder>> {
    get { __data["updatedAt"] }
    set { __data["updatedAt"] = newValue }
  }
}
