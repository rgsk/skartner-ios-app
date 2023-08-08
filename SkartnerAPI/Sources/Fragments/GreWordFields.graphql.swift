// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct GreWordFields: SkartnerAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment GreWordFields on GreWord { __typename id spelling status gptPrompts { __typename id input response editedResponse greWordId } greWordTags { __typename id name } }"#
  }

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

  /// GptPrompt
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

  /// GreWordTag
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
