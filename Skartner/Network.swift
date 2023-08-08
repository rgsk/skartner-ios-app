//
//  Network.swift
//  Skartner
//
//  Created by Rahul Gupta on 08/08/23.
//

import Foundation
import Apollo


class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://192.168.29.114:8001/graphql")!)
}
