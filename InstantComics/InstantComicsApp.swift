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
    
    var body: some Scene {
        WindowGroup {
            ComicsView()
        }
        .onChange(of: scenePhase) { phase in // This is to see when the app is activ go inactive. I didn't need it for any action when the app goes in the background or when it become active again.
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
}
