//
//  NetworkService.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint) async -> NetworkResult<T>
}

final class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint) async -> NetworkResult<T>  {
        var request = endpoint.urlRequest
        print(request.url)
        print(request.httpBody)
        
        if let token = KeychainManager.getToken() {
            request.addValue("\(token)", forHTTPHeaderField: "Authorization")
        } else {
            print("[KeyChainError] = 토큰을 찾을 수 없습니다.")
        }
                
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(statusCode: -1, message: "[Error] - Invalid Response")
            }
            
            if let newToken = httpResponse.value(forHTTPHeaderField: "Authorization"),
                let token = newToken.data(using: .utf8) {
                try KeychainManager.save(token: token)
            }

            switch httpResponse.statusCode {
            case 200..<300:
                if let decoded = try? JSONDecoder().decode(T.self, from: data) {
                    return .success(data: decoded, statusCode: httpResponse.statusCode)
                } else {
                    return .failure(statusCode: httpResponse.statusCode, message: "[Error] - Decoding Error")
                }
            default:
//                let message = try? JSONDecoder().decode(CommonMsgResDTO.self, from: data).message
                return .failure(statusCode: httpResponse.statusCode, message: nil)
            }

        } catch {
            return .failure(statusCode: -1, message: error.localizedDescription)
        }
    }
}
