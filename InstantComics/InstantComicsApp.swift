//
//  InstantComicsApp.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 15/03/2021.
//

import SwiftUI

@main
struct InstantComicsApp: App {// Replaysing the app delegate. This is where the app start everything
    @Environment(\.scenePhase) var scenePhase
    
//    func inti() {
//        // config library
//        doSomething() // this is an example
//    }
    
    var body: some Scene {
        WindowGroup {
            ComicListView()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                print("background")
            case .inactive:
                print("inactive")
            case .active:
                print("active")
            @unknown default:
                print("background")
            }
        }
    }
    
//    func doSomething() {
//        //rest of the example
//    }
}
