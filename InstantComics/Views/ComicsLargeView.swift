//
//  ComicsLargeView.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 18/03/2021.
//

import SwiftUI

struct ComicsLargeView: View {
    @ObservedObject var comicsVM = ComicsViewModel()
    @State var showAlert = false
    @State var buttonAction: Int? = 0
    @State private var description = ""
    
    var body: some View {
        HStack {
            Spacer()
            // Left container
            VStack {
                Spacer()
                
                // Comic title
                Text(comicsVM.title)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 30))
                
                Spacer()
                
                // Top button container
                HStack {
                    Button(action: {
                        comicsVM.onClickPreviousButton()
                    }) {
                        Text("<  Previous")
                            .padding()
                            .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        comicsVM.onClickRandomButton()
                    }) {
                        Text("Random")
                            .padding()
                            .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        comicsVM.onClickNextButton()
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
                
                Spacer()
                
                // Bottom buttons container
                HStack{
                    Button(action: {
                        comicsVM.onClickSkipToTheStartButton()
                    }) {
                        Text("|<")
                            .frame(width: 50, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                    // Passing the description variable to the Description view through Navigation link
                    NavigationLink(destination: DescriptionView(description: self.$description), tag: 1, selection: $buttonAction) {
                            EmptyView()
                        }
                    
                    Button(action: {
                        self.description = comicsVM.description
                        self.buttonAction = 1
                    }) {
                        Text("Description")
                            .frame(width: 120, height: 40, alignment: .center)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                    
                    Button(action: actionSheet) {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 36, height: 36)
                            }
                        
                    Spacer()
                    
                    Button(action: {
                        comicsVM.onClickSkipToTheEndButton()
                    }) {
                        Text(">|")
                            .frame(width: 50, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.trailing, 20)
                }
                
                Spacer()
                
                // Information container
                HStack {
                    Text("No: \(comicsVM.num)")
                    
                    Spacer()
                    
                    Text("Day: \(comicsVM.month)")
                    
                    Spacer()
                    
                    Text("Month: \(comicsVM.month)")
                    
                    Spacer()
                    
                    Text("Year: \(comicsVM.year)")
                }
                .padding()
                
            }
            
            // Image container, and right container
            VStack{
                Image(uiImage: comicsVM.image.load())
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, idealWidth: 400,  maxWidth: .infinity, minHeight: 0, idealHeight: 350, maxHeight: .infinity, alignment: .center)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .onLongPressGesture {
                        print("pressed")
                        self.showAlert = true
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(""), message: Text(comicsVM.alt), dismissButton: .default(Text("Close")))
                    }
                Text("Press and hold the image to se the description!")
                    .padding(.bottom, 17)
            }
    
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .border(Color.purple)
        .onAppear {
            comicsVM.fetchCurrentComicData()
        }
    }
    
    func actionSheet() {
        guard let data = URL(string: comicsVM.image) else { return }
        let activityVC = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
    var isNewestComic: Bool {
        return comicsVM.currentComicNumber == comicsVM.newestComicNumber
    }
    
    var buttonColor: Color {
        return isNewestComic ? .gray : .blue
    }
}

struct ComicsLargeView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsLargeView().previewLayout(.fixed(width: 896, height: 414))
    }
}
