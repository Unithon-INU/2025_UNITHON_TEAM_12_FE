//
//  Endpoint.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    var urlRequest: URLRequest {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
        components.queryItems = queryItems

        guard let url = components.url else {
            fatalError("[URL Error] URL이 올바르지 않습니다.")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        request.httpBody = body
        return request
    }
}
