// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GreWordTagsQuery: GraphQLQuery {
  public static let operationName: String = "greWordTags"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query greWordTags($where: GreWordTagWhereInput) { greWordTags(where: $where) { __typename id name } }"#
    ))

  public var `where`: GraphQLNullable<GreWordTagWhereInput>

  public init(`where`: GraphQLNullable<GreWordTagWhereInput>) {
    self.`where` = `where`
  }

  public var __variables: Variables? { ["where": `where`] }

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("greWordTags", [GreWordTag].self, arguments: ["where": .variable("where")]),
    ] }

    public var greWordTags: [GreWordTag] { __data["greWordTags"] }

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
}
