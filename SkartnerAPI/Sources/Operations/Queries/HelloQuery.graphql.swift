// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class HelloQuery: GraphQLQuery {
  public static let operationName: String = "Hello"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Hello { hello { __typename message } }"#
    ))

  public init() {}

  public struct Data: SkartnerAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("hello", Hello.self),
    ] }

    public var hello: Hello { __data["hello"] }

    /// Hello
    ///
    /// Parent Type: `HelloWorld`
    public struct Hello: SkartnerAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SkartnerAPI.Objects.HelloWorld }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("message", String.self),
      ] }

      public var message: String { __data["message"] }
    }
  }
}
