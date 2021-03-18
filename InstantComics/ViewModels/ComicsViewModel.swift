//
//  ComicsViewModel.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 16/03/2021.
//

import Combine
import Foundation
import Dispatch

class ComicsViewModel: ObservableObject {
    
    @Published private var comicsData: ComicsResponse?
    @Published var error: NetworkError?
    
    // Comics data properties
    var image: String {
        guard let imageString = comicsData?.img else {
            return ""
        }
        return imageString
    }
    
    var title: String {
        guard let titleString = comicsData?.title else {
            return ""
        }
        return titleString
    }
    
    var month: String {
        guard let monthString = comicsData?.month else {
            return ""
        }
        return monthString
    }
    
    var year: String {
        guard let yearString = comicsData?.year else {
            return ""
        }
        return yearString
    }
    
    var num: Int {
        guard let numInt = comicsData?.num else {
            return 0
        }
        return numInt
    }
    
    // Fetching data, the latest comic
    func fetchComicsData() {
        
        Webservice().getComics { result in
            switch result {
            case .success(let comicsData):
                self.comicsData = comicsData
                print(self.comicsData as Any)
            case .failure(let error):
                switch error {
                case .urlError:
                    print("Something wrong with the url")
                case .getDataError:
                    print("No data")
                case .decodingError:
                    print("Fail to decode")
                }
            }
        }
    }
}
