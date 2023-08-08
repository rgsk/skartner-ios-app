// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class StatusWiseGreWordCountQuery: GraphQLQuery {
  public static let operationName: String = "StatusWiseGreWordCount"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query StatusWiseGreWordCount($userId: String!, $greWordTags: GreWordTagListRelationFilter) { STARTED_LEARNING: greWordsCount( where: {status: {equals: STARTED_LEARNING}, userId: {equals: $userId}, greWordTags: $greWordTags} ) STILL_LEARNING: greWordsCount( where: {status: {equals: STILL_LEARNING}, userId: {equals: $userId}, greWordTags: $greWordTags} ) ALMOST_LEARNT: greWordsCount( where: {status: {equals: ALMOST_LEARNT}, userId: {equals: $userId}, greWordTags: $greWordTags} ) FINISHED_LEARNING: greWordsCount( where: {status: {equals: FINISHED_LEARNING}, userId: {equals: $userId}, greWordTags: $greWordTags} ) MEMORY_MODE: greWordsCount( where: {status: {equals: MEMORY_MODE}, userId: {equals: $userId}, greWordTags: $greWordTags} ) MASTERED: greWordsCount( where: {status: {equals: MASTERED}, userId: {equals: $userId}, greWordTags: $greWordTags} ) }"#
    ))

  public var userId: String
  public var greWordTags: GraphQLNullable<GreWordTagListRelationFilter>

  public init(
    userId: String,
    greWordTags: GraphQLNullable<GreWordTagListRelationFilter>
  ) {
    self.userId = userId
    self.greWordTags = greWordTags
  }

  public var __variables: Variables? { [
    "userId": userId,
    "greWordTags": greWordTags
  ] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("greWordsCount", alias: "STARTED_LEARNING", Int.self, arguments: ["where": [
        "status": ["equals": "STARTED_LEARNING"],
        "userId": ["equals": .variable("userId")],
        "greWordTags": .variable("greWordTags")
      ]]),
      .field("greWordsCount", alias: "STILL_LEARNING", Int.self, arguments: ["where": [
        "status": ["equals": "STILL_LEARNING"],
        "userId": ["equals": .variable("userId")],
        "greWordTags": .variable("greWordTags")
      ]]),
      .field("greWordsCount", alias: "ALMOST_LEARNT", Int.self, arguments: ["where": [
        "status": ["equals": "ALMOST_LEARNT"],
        "userId": ["equals": .variable("userId")],
        "greWordTags": .variable("greWordTags")
      ]]),
      .field("greWordsCount", alias: "FINISHED_LEARNING", Int.self, arguments: ["where": [
        "status": ["equals": "FINISHED_LEARNING"],
        "userId": ["equals": .variable("userId")],
        "greWordTags": .variable("greWordTags")
      ]]),
      .field("greWordsCount", alias: "MEMORY_MODE", Int.self, arguments: ["where": [
        "status": ["equals": "MEMORY_MODE"],
        "userId": ["equals": .variable("userId")],
        "greWordTags": .variable("greWordTags")
      ]]),
      .field("greWordsCount", alias: "MASTERED", Int.self, arguments: ["where": [
        "status": ["equals": "MASTERED"],
        "userId": ["equals": .variable("userId")],
        "greWordTags": .variable("greWordTags")
      ]]),
    ] }

    public var started_learning: Int { __data["STARTED_LEARNING"] }
    public var still_learning: Int { __data["STILL_LEARNING"] }
    public var almost_learnt: Int { __data["ALMOST_LEARNT"] }
    public var finished_learning: Int { __data["FINISHED_LEARNING"] }
    public var memory_mode: Int { __data["MEMORY_MODE"] }
    public var mastered: Int { __data["MASTERED"] }
  }
}
