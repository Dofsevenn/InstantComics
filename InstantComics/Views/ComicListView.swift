//
//  ContentView.swift
//  InstantComics
//
//  Created by Kjetil Skyldstad Bjelldokken on 15/03/2021.
//

import SwiftUI

struct ComicListView: View {
    // Need run do this because SwiftUI dont support color change of list and navigationview in a good way that I could find.
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = UIColor(red: 0.94, green: 1.00, blue: 0.95, alpha: 1.00)
        UITableView.appearance().backgroundColor = UIColor.CustomBackground.black
    }
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    @ObservedObject var comicsVM = ComicsViewModel()
    
    // If curren == number -> get all numbers lover than current
    // If number == 0 -> get all numbers higer then current
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.CustomBackground.black)
                if sizeClass == .compact {
                    List {
                        Section(header: Text("Comics")) {
                            NavigationLink(destination: DetailView()) {
                                ComicsRowCompacView()
                            }
                            
                        }.listRowBackground(Color(UIColor.CustomRowBackground.black))
                    }
                    .environment(\.defaultMinListRowHeight, 60)
                    .navigationTitle("Comic List")
                    .listStyle(GroupedListStyle())
                } else {
                    List {
                        Section(header: Text("Comics")) {
                            // Make this a RowView, and split screen
                            HStack{
                                VStack(alignment: .leading, spacing: 10){
                                    Text("Titel: \(comicsVM.title)")
                                    //.padding(.top, 20)
                                    
                                    Text("ReleaseNo: \(comicsVM.num)")
                                    
                                    
                                    Text("Month: \(comicsVM.month)")
                                    
                                    
                                    Text("Year: \(comicsVM.year)")
                                }
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                                .padding()
                                //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                Spacer()
                                
                                Image(uiImage: comicsVM.image.load())
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            
                        }//.listRowBackground(Color(red: 0.85, green: 1.00, blue: 0.99))
                    }
                    .environment(\.defaultMinListRowHeight, 60)
                    .navigationTitle("Comic List")
                    .listStyle(GroupedListStyle())
                }
            }
        }
        
    }
}


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
    
    struct CustomRowBackground{
        static var black: UIColor{
            if #available(iOS 13, *) {
                return UIColor.init { (trait) -> UIColor in
                    return trait.userInterfaceStyle == .dark ? UIColor.systemGray6 : UIColor(red: 0.85, green: 1.00, blue: 0.99, alpha: 1.00)
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
        ComicListView()
    }
}
