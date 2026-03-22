//
//  ViewModel.swift
//  Blossom Movie
//
//  Created by Khushneet Singh on 22/03/26.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    private(set) var homestatus: FetchStatus = .notStarted
    private let dataFetcher: DataFetcher()
    var trendingMovies: [Title] = []
    
    func getTitles() async {
        homestatus = .fetching
        
        do {
            trendingMovies = try await dataFetcher.fetchTitles(for: "Movies")
            homestatus = .success
        } catch {
            print(error)
            homestatus = .failed(underlyingError: error)
        }
    }
}
