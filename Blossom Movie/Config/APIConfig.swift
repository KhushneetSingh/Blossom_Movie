//
//  APIConfig.swift
//  Blossom Movie
//
//  Created by Khushneet Singh on 13/03/26.
//

import Foundation

struct APIConfig: Decodable {
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    
    static let shared: APIConfig? = {
        do {
            return try loadconfig()
        } catch {
            print("Failed to load API Config: \(error.localizedDescription)")
            return nil
        }
    }()
    
    private static func loadconfig() throws -> APIConfig {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else {
            throw APIConfigError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(APIConfig.self, from: data)
        } catch let error as DecodingError {
            throw APIConfigError.decodingFailed(underlyingError: error)
        } catch {
            throw APIConfigError.decodingFailed(underlyingError: error)
        }
    }
}
