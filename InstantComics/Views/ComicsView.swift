//
//  ContentView.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 15/03/2021.
//

import SwiftUI

struct ComicsView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    @ObservedObject var comicsVM = ComicsViewModel()
    
    // If curren == number -> get all numbers lover than current
    // If number == 0 -> get all numbers higer then current
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.CustomBackground.black)
                
                if sizeClass == .compact {
                        ComicsCompacView()
                            .navigationTitle("Comic List")
                } else {
                    ComicsLargeView()
                        .navigationTitle("Comic List")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// Made this extension so that I could change the color in light mode and still have the dark mode black
extension UIColor{
    struct CustomBackground {
        static var black: UIColor{
            if #available(iOS 13, *) {
                return UIColor.init { (trait) -> UIColor in
                    return trait.userInterfaceStyle == .dark ? UIColor.black : UIColor(red: 0.94, green: 1.00, blue: 0.95, alpha: 1.00)
                }
            }
            return UIColor.black
        }
    }
}

// Converting image string to url, and then to data and then create UIImage from data
extension String {
    
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        
        return UIImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsView()
    }
}
