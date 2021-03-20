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
    
    var alt: String {
        guard let altString = currentComicData?.alt else {
            return ""
        }
        return altString
    }
    
    var description: String {
        print(self.currentComicData?.transcript as Any)
        guard let descriptionString = currentComicData?.transcript else {
            return ""
        }
        return descriptionString
    }
    
    // Get previous comic when previous button is clicked
    func onClickPreviousButton() {
        if currentComicNumber == 1 {
            return
        } else {
            currentComicNumber -= 1
        }
        fetchSpesificComicData(number: currentComicNumber)
    }
    
    // Get next comic when next button is clicked
    func onClickNextButton() {
        if currentComicNumber == newestComicNumber {
            return
        } else {
            currentComicNumber += 1
        }
        fetchSpesificComicData(number: currentComicNumber)
    }
    
    // Get random comic when random button is clicked
    func onClickRandomButton() {
        currentComicNumber = Int.random(in: 1...newestComicNumber)
        fetchSpesificComicData(number: currentComicNumber)
    }
    
    // Get the newest comic when Skip to the end button is clicked
    func onClickSkipToTheEndButton() {
        fetchCurrentComicData()
    }
    
    // Get the first comic when Skip to the start button is clicked
    func onClickSkipToTheStartButton() {
        fetchSpesificComicData(number: 1)
    }
    
    // Fetching data from Api, the newest comic
    func fetchCurrentComicData() {
        let url = "http://xkcd.com/info.0.json"
        
        Webservice().getCurrentComic(url: url) { result in
            switch result {
            case .success(let currentComicData):
                self.currentComicData = currentComicData
                self.newestComicNumber = self.currentComicData?.num ?? 0
                self.currentComicNumber = self.newestComicNumber
                print(self.currentComicData?.transcript as Any)
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
                print(self.currentComicData?.transcript as Any)
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
