// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteGreWordTagMutation: GraphQLMutation {
  public static let operationName: String = "DeleteGreWordTag"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteGreWordTag($name: String!) { deleteGreWordTag(name: $name) { __typename id name } }"#
    ))

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var __variables: Variables? { ["name": name] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("deleteGreWordTag", DeleteGreWordTag.self, arguments: ["name": .variable("name")]),
    ] }

    public var deleteGreWordTag: DeleteGreWordTag { __data["deleteGreWordTag"] }

    /// DeleteGreWordTag
    ///
    /// Parent Type: `GreWordTag`
    public struct DeleteGreWordTag: SkartnerAPI.SelectionSet {
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
