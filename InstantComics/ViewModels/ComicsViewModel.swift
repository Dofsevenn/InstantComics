//
//  ComicsViewModel.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 16/03/2021.
//

import Combine
import Foundation
import Dispatch
import SwiftUI

class ComicsViewModel: ObservableObject {
    
    @Published private var currentComicData: ComicsResponse?
    @Published private var specificComicData: ComicsResponse?
    @Published var error: NetworkError?
    
    var newestComicNumber = 0
    var currentComicNumber = 0
    
    // Current Comics data properties
    var image: String {
        guard let imageString = currentComicData?.img else {
            return ""
        }
        return imageString
    }
    
    var title: String {
        guard let titleString = currentComicData?.title else {
            return ""
        }
        return titleString
    }
    
    var month: String {
        guard let monthString = currentComicData?.month else {
            return ""
        }
        return monthString
    }
    
    var year: String {
        guard let yearString = currentComicData?.year else {
            return ""
        }
        return yearString
    }
    
    var num: Int {
        guard let numInt = currentComicData?.num else {
            return 0
        }
        return numInt
    }
    
    
    func onClickPreviousComic() {
        if currentComicNumber == 1 {
            return
        } else {
            currentComicNumber = currentComicNumber - 1
        }
        fetchSpesificComicData(number: currentComicNumber)
    }
    
    func onClickNextComic() {
        if currentComicNumber == newestComicNumber {
            
        }
    }
    
     // Logic to fetch the previous comic
//    func getPreviousComic() {
//        currentDisplayedComicNumber =
//
//        if currentDisplayedComicNumber > 1 {
//            fetchSpesificComicData() med currentDisplayedComicNumber - 1
//        }
//    }
    
//    func getTestComic() {
//        var url = "http://xkcd.com/info.0.json"
//        var newesComicData = fetchCurrentComicData(url: url)
//    }
    
    // Fetching data from Api, the newest comic
    func fetchCurrentComicData() {
        let url = "http://xkcd.com/info.0.json"
        
        Webservice().getCurrentComic(url: url) { result in
            switch result {
            case .success(let currentComicData):
                self.currentComicData = currentComicData
                self.newestComicNumber = self.currentComicData?.num ?? 0
                self.currentComicNumber = self.newestComicNumber
                //print(self.currentComicData as Any)
                //print(self.newestComicNumber)
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
    
    // Fetching data from Api, specific comic based on button click by user
    func fetchSpesificComicData(number: Int) {
        let url = "http://xkcd.com/\(number)/info.0.json"
        
        Webservice().getSpecifiedComic(url: url) { result in
            switch result {
            case .success(let specificComicData):
                self.currentComicData = specificComicData
                self.currentComicNumber = self.currentComicData?.num ?? 0
                //print(self.specificComicData as Any)
                print(self.currentComicNumber)
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
