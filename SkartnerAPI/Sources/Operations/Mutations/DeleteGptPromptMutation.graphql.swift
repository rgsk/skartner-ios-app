// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteGptPromptMutation: GraphQLMutation {
  public static let operationName: String = "DeleteGptPrompt"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteGptPrompt($deleteGptPromptId: String!) { deleteGptPrompt(id: $deleteGptPromptId) { __typename id } }"#
    ))

  public var deleteGptPromptId: String

  public init(deleteGptPromptId: String) {
    self.deleteGptPromptId = deleteGptPromptId
  }

  public var __variables: Variables? { ["deleteGptPromptId": deleteGptPromptId] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("deleteGptPrompt", DeleteGptPrompt?.self, arguments: ["id": .variable("deleteGptPromptId")]),
    ] }

    public var deleteGptPrompt: DeleteGptPrompt? { __data["deleteGptPrompt"] }

    /// DeleteGptPrompt
    ///
    /// Parent Type: `GptPrompt`
    public struct DeleteGptPrompt: SkartnerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.GptPrompt }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", String.self),
      ] }

      public var id: String { __data["id"] }
    }
  }
}
