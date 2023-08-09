// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GreWordQuery: GraphQLQuery {
  public static let operationName: String = "GreWord"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GreWord($where: GreWordWhereUniqueInput) { greWord(where: $where) { __typename id spelling status gptPrompts { __typename id input response editedResponse greWordId } greWordTags { __typename id name } } }"#
    ))

  public var `where`: GraphQLNullable<GreWordWhereUniqueInput>

  public init(`where`: GraphQLNullable<GreWordWhereUniqueInput>) {
    self.`where` = `where`
  }

  public var __variables: Variables? { ["where": `where`] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("greWord", GreWord?.self, arguments: ["where": .variable("where")]),
    ] }

    public var greWord: GreWord? { __data["greWord"] }

    /// GreWord
    ///
    /// Parent Type: `GreWord`
    public struct GreWord: SkartnerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.GreWord }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", String.self),
        .field("spelling", String.self),
        .field("status", GraphQLEnum<SkartnerAPI.GreWordStatus>.self),
        .field("gptPrompts", [GptPrompt].self),
        .field("greWordTags", [GreWordTag]?.self),
      ] }

      public var id: String { __data["id"] }
      public var spelling: String { __data["spelling"] }
      public var status: GraphQLEnum<SkartnerAPI.GreWordStatus> { __data["status"] }
      public var gptPrompts: [GptPrompt] { __data["gptPrompts"] }
      public var greWordTags: [GreWordTag]? { __data["greWordTags"] }

      /// GreWord.GptPrompt
      ///
      /// Parent Type: `GptPrompt`
      public struct GptPrompt: SkartnerAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.GptPrompt }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", String.self),
          .field("input", String.self),
          .field("response", String.self),
          .field("editedResponse", String?.self),
          .field("greWordId", String?.self),
        ] }

        public var id: String { __data["id"] }
        public var input: String { __data["input"] }
        public var response: String { __data["response"] }
        public var editedResponse: String? { __data["editedResponse"] }
        public var greWordId: String? { __data["greWordId"] }
      }

      /// GreWord.GreWordTag
      ///
      /// Parent Type: `GreWordTag`
      public struct GreWordTag: SkartnerAPI.SelectionSet {
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
}
