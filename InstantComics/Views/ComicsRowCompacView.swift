//
//  ComicsRowView.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 17/03/2021.
//

import SwiftUI

struct ComicsRowCompacView: View {
    @ObservedObject var comicsVM = ComicsViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Titel: \(comicsVM.title)")
            //.padding(.top, 20)
            
            Image(uiImage: comicsVM.image.load())
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, idealWidth: 200,  maxWidth: .infinity, minHeight: 0, idealHeight: 150, maxHeight: .infinity, alignment: .center)
                //.border(Color.red)
            
            HStack {
                Text("ReleaseNo: \(comicsVM.num)")
                
                Spacer()
                
                Text("Month: \(comicsVM.month)")
                
                Spacer()
                
                Text("Year: \(comicsVM.year)")
            }
            //.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
            //.padding()
            //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            //Spacer()
            
            
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .onAppear {
            comicsVM.fetchComicsData()
        }
    }
}

struct ComicsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsRowCompacView()
    }
}
