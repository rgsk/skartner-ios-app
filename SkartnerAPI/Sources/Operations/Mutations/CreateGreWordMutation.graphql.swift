// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateGreWordMutation: GraphQLMutation {
  public static let operationName: String = "createGreWord"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation createGreWord($spelling: String!, $promptInput: String!, $promptResponse: String!, $userId: String!, $greWordTags: [GreWordTagWhereUniqueInput]) { createGreWord( spelling: $spelling promptInput: $promptInput promptResponse: $promptResponse userId: $userId greWordTags: $greWordTags ) { __typename ...GreWordFields } }"#,
      fragments: [GreWordFields.self]
    ))

  public var spelling: String
  public var promptInput: String
  public var promptResponse: String
  public var userId: String
  public var greWordTags: GraphQLNullable<[GreWordTagWhereUniqueInput?]>

  public init(
    spelling: String,
    promptInput: String,
    promptResponse: String,
    userId: String,
    greWordTags: GraphQLNullable<[GreWordTagWhereUniqueInput?]>
  ) {
    self.spelling = spelling
    self.promptInput = promptInput
    self.promptResponse = promptResponse
    self.userId = userId
    self.greWordTags = greWordTags
  }

  public var __variables: Variables? { [
    "spelling": spelling,
    "promptInput": promptInput,
    "promptResponse": promptResponse,
    "userId": userId,
    "greWordTags": greWordTags
  ] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createGreWord", CreateGreWord.self, arguments: [
        "spelling": .variable("spelling"),
        "promptInput": .variable("promptInput"),
        "promptResponse": .variable("promptResponse"),
        "userId": .variable("userId"),
        "greWordTags": .variable("greWordTags")
      ]),
    ] }

    public var createGreWord: CreateGreWord { __data["createGreWord"] }

    /// CreateGreWord
    ///
    /// Parent Type: `GreWord`
    public struct CreateGreWord: SkartnerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.GreWord }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(GreWordFields.self),
      ] }

      public var id: String { __data["id"] }
      public var spelling: String { __data["spelling"] }
      public var status: GraphQLEnum<SkartnerAPI.GreWordStatus> { __data["status"] }
      public var gptPrompts: [GreWordFields.GptPrompt] { __data["gptPrompts"] }
      public var greWordTags: [GreWordFields.GreWordTag]? { __data["greWordTags"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var greWordFields: GreWordFields { _toFragment() }
      }
    }
  }
}
