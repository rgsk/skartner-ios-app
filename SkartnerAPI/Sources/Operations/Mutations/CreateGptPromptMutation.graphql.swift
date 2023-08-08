// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateGptPromptMutation: GraphQLMutation {
  public static let operationName: String = "createGptPrompt"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation createGptPrompt($input: String!, $response: String!, $greWordId: String!) { createGptPrompt(input: $input, response: $response, greWordId: $greWordId) { __typename id response } }"#
    ))

  public var input: String
  public var response: String
  public var greWordId: String

  public init(
    input: String,
    response: String,
    greWordId: String
  ) {
    self.input = input
    self.response = response
    self.greWordId = greWordId
  }

  public var __variables: Variables? { [
    "input": input,
    "response": response,
    "greWordId": greWordId
  ] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createGptPrompt", CreateGptPrompt.self, arguments: [
        "input": .variable("input"),
        "response": .variable("response"),
        "greWordId": .variable("greWordId")
      ]),
    ] }

    public var createGptPrompt: CreateGptPrompt { __data["createGptPrompt"] }

    /// CreateGptPrompt
    ///
    /// Parent Type: `GptPrompt`
    public struct CreateGptPrompt: SkartnerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.GptPrompt }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", String.self),
        .field("response", String.self),
      ] }

      public var id: String { __data["id"] }
      public var response: String { __data["response"] }
    }
  }
}
