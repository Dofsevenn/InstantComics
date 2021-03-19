//
//  ComicsRowView.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 17/03/2021.
//
import Combine
import SwiftUI

struct ComicsCompacView: View {
    @ObservedObject var comicsVM = ComicsViewModel()
    @State private var buttonDisabled = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Spacer()
            
            Text(comicsVM.title)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.system(size: 30))
                
            Spacer()
           
            HStack {
                Button(action: {
                    comicsVM.onClickPreviousComic()
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
                        .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    print("Clicked")
                    if comicsVM.currentComicNumber == comicsVM.newestComicNumber {
                        buttonDisabled = true
                    } else {
                        buttonDisabled = false
                    }
                }) {
                    Text("next  >")
                        .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(buttonColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(isNewestComic)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Image(uiImage: comicsVM.image.load())
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, idealWidth: 400,  maxWidth: .infinity, minHeight: 0, idealHeight: 350, maxHeight: .infinity, alignment: .center)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                
            Spacer()
            
            HStack {
                Text("ReleaseNo: \(comicsVM.num)")
                
                Spacer()
                
                Text("Month: \(comicsVM.month)")
                
                Spacer()
                
                Text("Year: \(comicsVM.year)")
            }
            .padding()
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .border(Color.purple)
        .onAppear {
            comicsVM.fetchCurrentComicData()
        }
    }
    
    var isNewestComic: Bool {
        return comicsVM.currentComicNumber == comicsVM.newestComicNumber
    }
    
    var buttonColor: Color {
        return isNewestComic ? .gray : .blue
    }
}

struct ComicsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsCompacView()
    }
}
