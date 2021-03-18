//
//  ComicsLargeView.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 18/03/2021.
//

import SwiftUI

struct ComicsLargeView: View {
    @ObservedObject var comicsVM = ComicsViewModel()
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                Text(comicsVM.title)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 30))
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Button(action: {
                        print("Clicked")
                    }) {
                        Text("<  Previous")
                            .padding()
                            .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        print("Clicked")
                    }) {
                        Text("Random")
                            .padding()
                            .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        print("Clicked")
                    }) {
                        Text("next  >")
                            .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                HStack {
                    Text("ReleaseNo: \(comicsVM.num)")
                    
                    Spacer()
                    
                    Text("Month: \(comicsVM.month)")
                    
                    Spacer()
                    
                    Text("Year: \(comicsVM.year)")
                }
                .padding()
                
            }
            
            Image(uiImage: comicsVM.image.load())
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, idealWidth: 400,  maxWidth: .infinity, minHeight: 0, idealHeight: 350, maxHeight: .infinity, alignment: .center)
                .padding(.top, 10)
                .padding(.trailing, 10)
    
            Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .border(Color.purple)
        .onAppear {
            comicsVM.fetchComicsData()
        }
    }
}

struct ComicsLargeView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsLargeView().previewLayout(.fixed(width: 896, height: 414))
    }
}
