// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SendSinglePromptQuery: GraphQLQuery {
  public static let operationName: String = "sendSinglePrompt"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query sendSinglePrompt($input: String!, $skipCache: Boolean, $indexesReturned: [Int!], $resultIndexFromCache: Int) { sendSinglePrompt( input: $input skipCache: $skipCache indexesReturned: $indexesReturned resultIndexFromCache: $resultIndexFromCache ) { __typename result resultIndex error totalResultsInCache } }"#
    ))

  public var input: String
  public var skipCache: GraphQLNullable<Bool>
  public var indexesReturned: GraphQLNullable<[Int]>
  public var resultIndexFromCache: GraphQLNullable<Int>

  public init(
    input: String,
    skipCache: GraphQLNullable<Bool>,
    indexesReturned: GraphQLNullable<[Int]>,
    resultIndexFromCache: GraphQLNullable<Int>
  ) {
    self.input = input
    self.skipCache = skipCache
    self.indexesReturned = indexesReturned
    self.resultIndexFromCache = resultIndexFromCache
  }

  public var __variables: Variables? { [
    "input": input,
    "skipCache": skipCache,
    "indexesReturned": indexesReturned,
    "resultIndexFromCache": resultIndexFromCache
  ] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("sendSinglePrompt", SendSinglePrompt.self, arguments: [
        "input": .variable("input"),
        "skipCache": .variable("skipCache"),
        "indexesReturned": .variable("indexesReturned"),
        "resultIndexFromCache": .variable("resultIndexFromCache")
      ]),
    ] }

    public var sendSinglePrompt: SendSinglePrompt { __data["sendSinglePrompt"] }

    /// SendSinglePrompt
    ///
    /// Parent Type: `SendSinglePromptResponse`
    public struct SendSinglePrompt: SkartnerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.SendSinglePromptResponse }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("result", String?.self),
        .field("resultIndex", Int?.self),
        .field("error", String?.self),
        .field("totalResultsInCache", Int.self),
      ] }

      public var result: String? { __data["result"] }
      public var resultIndex: Int? { __data["resultIndex"] }
      public var error: String? { __data["error"] }
      public var totalResultsInCache: Int { __data["totalResultsInCache"] }
    }
  }
}
