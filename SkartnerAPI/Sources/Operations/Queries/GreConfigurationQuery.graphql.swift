// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GreConfigurationQuery: GraphQLQuery {
  public static let operationName: String = "GreConfiguration"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GreConfiguration { greConfiguration { __typename defaultGreWordSearchPromptInputs } }"#
    ))

  public init() {}

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("greConfiguration", GreConfiguration.self),
    ] }

    public var greConfiguration: GreConfiguration { __data["greConfiguration"] }

    /// GreConfiguration
    ///
    /// Parent Type: `GreConfiguration`
    public struct GreConfiguration: SkartnerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.GreConfiguration }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("defaultGreWordSearchPromptInputs", [String].self),
      ] }

      public var defaultGreWordSearchPromptInputs: [String] { __data["defaultGreWordSearchPromptInputs"] }
    }
  }
}
