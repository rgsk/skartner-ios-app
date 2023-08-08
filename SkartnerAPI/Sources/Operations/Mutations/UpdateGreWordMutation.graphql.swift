// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateGreWordMutation: GraphQLMutation {
  public static let operationName: String = "updateGreWord"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation updateGreWord($updateGreWordId: String!, $greWordTags: [GreWordTagWhereUniqueInput], $status: GreWordStatus) { updateGreWord(id: $updateGreWordId, greWordTags: $greWordTags, status: $status) { __typename id } }"#
    ))

  public var updateGreWordId: String
  public var greWordTags: GraphQLNullable<[GreWordTagWhereUniqueInput?]>
  public var status: GraphQLNullable<GraphQLEnum<GreWordStatus>>

  public init(
    updateGreWordId: String,
    greWordTags: GraphQLNullable<[GreWordTagWhereUniqueInput?]>,
    status: GraphQLNullable<GraphQLEnum<GreWordStatus>>
  ) {
    self.updateGreWordId = updateGreWordId
    self.greWordTags = greWordTags
    self.status = status
  }

  public var __variables: Variables? { [
    "updateGreWordId": updateGreWordId,
    "greWordTags": greWordTags,
    "status": status
  ] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("updateGreWord", UpdateGreWord?.self, arguments: [
        "id": .variable("updateGreWordId"),
        "greWordTags": .variable("greWordTags"),
        "status": .variable("status")
      ]),
    ] }

    public var updateGreWord: UpdateGreWord? { __data["updateGreWord"] }

    /// UpdateGreWord
    ///
    /// Parent Type: `GreWord`
    public struct UpdateGreWord: SkartnerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.GreWord }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", String.self),
      ] }

      public var id: String { __data["id"] }
    }
  }
}
