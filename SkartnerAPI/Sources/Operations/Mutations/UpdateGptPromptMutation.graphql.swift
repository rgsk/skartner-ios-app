// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateGptPromptMutation: GraphQLMutation {
  public static let operationName: String = "UpdateGptPrompt"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateGptPrompt($id: String!, $editedResponse: String) { updateGptPrompt(id: $id, editedResponse: $editedResponse) { __typename id editedResponse } }"#
    ))

  public var id: String
  public var editedResponse: GraphQLNullable<String>

  public init(
    id: String,
    editedResponse: GraphQLNullable<String>
  ) {
    self.id = id
    self.editedResponse = editedResponse
  }

  public var __variables: Variables? { [
    "id": id,
    "editedResponse": editedResponse
  ] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("updateGptPrompt", UpdateGptPrompt?.self, arguments: [
        "id": .variable("id"),
        "editedResponse": .variable("editedResponse")
      ]),
    ] }

    public var updateGptPrompt: UpdateGptPrompt? { __data["updateGptPrompt"] }

    /// UpdateGptPrompt
    ///
    /// Parent Type: `GptPrompt`
    public struct UpdateGptPrompt: SkartnerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.GptPrompt }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", String.self),
        .field("editedResponse", String?.self),
      ] }

      public var id: String { __data["id"] }
      public var editedResponse: String? { __data["editedResponse"] }
    }
  }
}
