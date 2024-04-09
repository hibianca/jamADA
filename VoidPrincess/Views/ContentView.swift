//
//  ContentView.swift
//  VoidPrincess
//
//  Created by Bianca Nathally Bezerra de Lima on 07/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharacterViewModel()
    @State private var selectedCategory: Category = .body
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack (alignment: .top){
            backgroundForCategory(selectedCategory)
                .resizable()
                .scaledToFit()
                .padding(.top, 40)
                .background(.white)
            
            Spacer()
            
            Image("top_bar")
                .resizable()
                .scaledToFit()
                .padding(40)
            
            VStack {
                VStack(alignment: .leading){
                    HStack{
                        Button(action: {
                            self.presentationMode
                                .wrappedValue
                                .dismiss()
                        }) {
                            Image("return")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding(.horizontal, 40)
                                .padding(.vertical, 25)
                        }
                        .navigationBarBackButtonHidden(true)
                        Spacer()
                    }
                }
                .padding(20)
                
                Spacer()
                
                CharacterView(viewModel: viewModel)
                    .frame(height: UIScreen.main.bounds.height * 1 / 2)
                
                Spacer()
                
                GeometryReader { geometry in
                    VStack {
                        HStack {
                            ForEach(Category.allCases) { category in
                                Button(action: {
                                    selectedCategory = category
                                }) {
                                    Image(selectedCategory == category ? "\(category.rawValue)_selected" : "\(category.rawValue)_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.height / 7, height: geometry.size.height / 10)
                                }
                                .padding()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                        }
                        .padding()
                        
                        GridView(options: viewModel.options[selectedCategory] ?? [], selectOption: viewModel.selectOption)
                            .frame(height: geometry.size.height / 2 - (geometry.size.width / 50))
                    }
                }
                .padding()
            }
        }
    }
    
    func backgroundForCategory(_ category: Category) -> Image {
        switch category {
        case .body:
            return Image("buttons1")
        case .skin:
            return Image("buttons2")
        case .hair:
            return Image("buttons3")
        case .bottom:
            return Image("buttons4")
        case .top:
            return Image("buttons5")
        case .shoe:
            return Image("buttons6")
        case .overlay:
            return Image("buttons7")
        case .background:
            return Image("buttons8")
        }
    }
}

#Preview {
    ContentView()
}
