// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GreWordsQuery: GraphQLQuery {
  public static let operationName: String = "greWords"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query greWords($where: GreWordWhereInput, $skip: Int, $take: Int, $orderBy: [GreWordOrderByWithRelationInput]) { greWords(where: $where, skip: $skip, take: $take, orderBy: $orderBy) { __typename ...GreWordFields } greWordsCount(where: $where) }"#,
      fragments: [GreWordFields.self]
    ))

  public var `where`: GraphQLNullable<GreWordWhereInput>
  public var skip: GraphQLNullable<Int>
  public var take: GraphQLNullable<Int>
  public var orderBy: GraphQLNullable<[GreWordOrderByWithRelationInput?]>

  public init(
    `where`: GraphQLNullable<GreWordWhereInput>,
    skip: GraphQLNullable<Int>,
    take: GraphQLNullable<Int>,
    orderBy: GraphQLNullable<[GreWordOrderByWithRelationInput?]>
  ) {
    self.`where` = `where`
    self.skip = skip
    self.take = take
    self.orderBy = orderBy
  }

  public var __variables: Variables? { [
    "where": `where`,
    "skip": skip,
    "take": take,
    "orderBy": orderBy
  ] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("greWords", [GreWord].self, arguments: [
        "where": .variable("where"),
        "skip": .variable("skip"),
        "take": .variable("take"),
        "orderBy": .variable("orderBy")
      ]),
      .field("greWordsCount", Int.self, arguments: ["where": .variable("where")]),
    ] }

    public var greWords: [GreWord] { __data["greWords"] }
    public var greWordsCount: Int { __data["greWordsCount"] }

    /// GreWord
    ///
    /// Parent Type: `GreWord`
    public struct GreWord: SkartnerAPI.SelectionSet {
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
