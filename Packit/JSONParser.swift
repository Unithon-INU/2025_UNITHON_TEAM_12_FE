//
//  JSONParser.swift
//  Packit
//
//  Created by Bowon Han on 5/24/25.
//

import Foundation


/// - NOTE: Mock data를 통해 API 연동 전 테스트 합니다.
class JSONParser {
    static func parse<T: Codable>(fileName: String) -> T? {
        guard let path = Bundle.main.path(
            forResource: fileName,
            ofType: "json"
        ) else {
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            
            let decodedObject = try decoder.decode(T.self, from: jsonData)
            return decodedObject
            
        } catch {
            print("JSON 파싱 에러: \(error)")
            return nil
        }
    }
}
