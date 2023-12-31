// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == SkartnerAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == SkartnerAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == SkartnerAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == SkartnerAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return SkartnerAPI.Objects.Query
    case "helloWorld": return SkartnerAPI.Objects.HelloWorld
    case "GreWord": return SkartnerAPI.Objects.GreWord
    case "GptPrompt": return SkartnerAPI.Objects.GptPrompt
    case "GreWordTag": return SkartnerAPI.Objects.GreWordTag
    case "Mutation": return SkartnerAPI.Objects.Mutation
    case "SendSinglePromptResponse": return SkartnerAPI.Objects.SendSinglePromptResponse
    case "GreConfiguration": return SkartnerAPI.Objects.GreConfiguration
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
