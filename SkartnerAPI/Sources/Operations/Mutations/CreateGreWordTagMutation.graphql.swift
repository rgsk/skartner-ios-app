// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateGreWordTagMutation: GraphQLMutation {
  public static let operationName: String = "CreateGreWordTag"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateGreWordTag($name: String!, $userId: String!) { createGreWordTag(name: $name, userId: $userId) { __typename id name } }"#
    ))

  public var name: String
  public var userId: String

  public init(
    name: String,
    userId: String
  ) {
    self.name = name
    self.userId = userId
  }

  public var __variables: Variables? { [
    "name": name,
    "userId": userId
  ] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createGreWordTag", CreateGreWordTag.self, arguments: [
        "name": .variable("name"),
        "userId": .variable("userId")
      ]),
    ] }

    public var createGreWordTag: CreateGreWordTag { __data["createGreWordTag"] }

    /// CreateGreWordTag
    ///
    /// Parent Type: `GreWordTag`
    public struct CreateGreWordTag: SkartnerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.GreWordTag }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", String.self),
        .field("name", String.self),
      ] }

      public var id: String { __data["id"] }
      public var name: String { __data["name"] }
    }
  }
}
