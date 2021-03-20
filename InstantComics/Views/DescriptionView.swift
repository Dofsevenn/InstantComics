//
//  DescriptionView.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 20/03/2021.
//

import SwiftUI

struct DescriptionView: View {
    @Binding var description: String
    
    var body: some View {
        ZStack {
            Color(UIColor.CustomBackground.black)
            ScrollView {
                VStack {
                    Text("Comic Description")
                        .bold()
                        .font(.system(size: 30))
                        .padding(.bottom, 20)
                    
                    if description == "" {
                        Text("There was no description found!")
                    } else {
                        Text(description)
                    }
                }
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
                .navigationBarTitle("Description", displayMode: .inline)
            }
        }
    }
}

//struct DescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionView()
//    }
//}
