//
//  ContentView.swift
//  VoidPrincess
//
//  Created by Bianca Nathally Bezerra de Lima on 07/04/24.
//

import SwiftUI

struct CharacterOption: Identifiable {
    let id = UUID()
    let name: String
    let category: Category
}

enum Category: String, CaseIterable, Identifiable {
    case body, skin, hair, bottom, top, shoe, overlay, background
    
    var id: String { self.rawValue }
}

class CharacterViewModel: ObservableObject {
    @Published var selectedBody: CharacterOption? {
        didSet {
            updateOptionsForSelectedBody()
        }
    }
    @Published var selectedSkin: CharacterOption? = nil
    @Published var selectedHair: CharacterOption? = nil
    @Published var selectedBottom: CharacterOption? = nil
    @Published var selectedTop: CharacterOption? = nil
    @Published var selectedShoe: CharacterOption? = nil
    @Published var selectedOverlay: CharacterOption? = nil
    
    @Published var options: [Category: [CharacterOption]] = [
        .body: [CharacterOption(name: "body_1_skin_3", category: .body),
                CharacterOption(name: "body_2_skin_3", category: .body)],
        
        .skin: [CharacterOption(name: "skin_1", category: .skin),
                CharacterOption(name: "skin_2", category: .skin)],
        .hair: [],
        .bottom: [],
        .top: [],
        .shoe: [],
        .overlay: [],
        .background: [],
    ]
    
    func selectOption(_ option: CharacterOption) {
        
        switch option.category {
        case .body:
            selectedBody = option
            updateOptionsForSelectedBody()
        case .skin:
            selectedSkin = option
        case .hair:
            selectedHair = option
        case .bottom:
            selectedBottom = option
        case .top:
            selectedTop = option
        case .shoe:
            selectedShoe = option
        case .overlay:
            selectedOverlay = option
        default:
            break
        }
    }
    
    func updateOptionsForSelectedBody() {
        guard let bodyName = selectedBody?.name else { return }
        
        switch bodyName {
        case "body_1_skin_3":
            options[.skin] = [
                CharacterOption(name: "body_1_skin_4", category: .hair),
                CharacterOption(name: "body_1_skin_3", category: .hair),
                CharacterOption(name: "body_1_skin_2", category: .hair),
                CharacterOption(name: "body_1_skin_1", category: .hair),
            ]
            
            options[.hair] = [
                CharacterOption(name: "hair_curly_1", category: .hair),
                CharacterOption(name: "hair_curly_1_2", category: .hair),
                CharacterOption(name: "body_1_curly_2_1", category: .hair),
                CharacterOption(name: "body_1_curly_2_2", category: .hair),
                CharacterOption(name: "body_1_curly_3_1", category: .hair),
                CharacterOption(name: "body_1_curly_3_2", category: .hair),
                CharacterOption(name: "body_1_curly_4_1", category: .hair),
                CharacterOption(name: "body_1_curly_4_2", category: .hair),
                CharacterOption(name: "body_1_straight_1_1", category: .hair),
                CharacterOption(name: "body_1_straight_1_2", category: .hair),
                CharacterOption(name: "body_1_straight_2_1", category: .hair),
                CharacterOption(name: "body_1_straight_2_2", category: .hair),
                CharacterOption(name: "body_1_straight_3_1", category: .hair),
                CharacterOption(name: "body_1_straight_3_2", category: .hair),
            ]
            
            options[.bottom] = [
                CharacterOption(name: "body_1_skirt_1", category: .bottom),
                CharacterOption(name: "body_1_skirt_2", category: .bottom)
            ]
            
            options[.top] = [
                CharacterOption(name: "body_1_cropped", category: .top),
                CharacterOption(name: "body_1_shirt", category: .top)
            ]
            
        case "body_2_skin_3":
            options[.skin] = [
                CharacterOption(name: "body_2_skin_4", category: .hair),
                CharacterOption(name: "body_2_skin_3", category: .hair),
                CharacterOption(name: "body_2_skin_2", category: .hair),
                CharacterOption(name: "body_2_skin_1", category: .hair),
            ]
            options[.hair] = [
                CharacterOption(name: "hair_curly_1", category: .hair),
                CharacterOption(name: "hair_curly_1_2", category: .hair),
                CharacterOption(name: "body_2_curly_2_1", category: .hair),
                CharacterOption(name: "body_2_curly_2_2", category: .hair),
                CharacterOption(name: "body_2_curly_3_1", category: .hair),
                CharacterOption(name: "body_2_curly_3_2", category: .hair),
                CharacterOption(name: "body_2_curly_4_1", category: .hair),
                CharacterOption(name: "body_2_curly_4_2", category: .hair),
                CharacterOption(name: "body_2_straight_1_1", category: .hair),
                CharacterOption(name: "body_2_straight_1_2", category: .hair),
                CharacterOption(name: "body_2_straight_2_1", category: .hair),
                CharacterOption(name: "body_2_straight_2_2", category: .hair),
                CharacterOption(name: "body_2_straight_3_1", category: .hair),
                CharacterOption(name: "body_2_straight_3_2", category: .hair),
            ]
            options[.bottom] = [
                CharacterOption(name: "body_2_skirt_1", category: .bottom),
                CharacterOption(name: "body_2_skirt_2", category: .bottom)
            ]
            options[.top] = [
                CharacterOption(name: "body_2_cropped", category: .top),
                CharacterOption(name: "body_2_shirt", category: .top)
            ]
        default:
            break
        }
        
        self.objectWillChange.send()
    }
}

struct ContentView: View {
    @StateObject private var viewModel = CharacterViewModel()
    @State private var selectedCategory: Category = .body
    
    var body: some View {
        ZStack{
            backgroundForCategory(selectedCategory)
                .resizable()
                .scaledToFill()
                .padding()
            
            VStack {
                Spacer()
                
                Image("top_bar")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
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
                                        // Ajuste dinâmico do tamanho baseado no tamanho da tela
                                        .frame(width: geometry.size.width / 14, height: geometry.size.width / 7)
                                }
                                .padding()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                        }
                        .padding()

                        GridView(options: viewModel.options[selectedCategory] ?? [], selectOption: viewModel.selectOption)
                            // Ajuste dinâmico da altura baseado no tamanho da tela
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

struct CharacterView: View {
    @ObservedObject var viewModel: CharacterViewModel
    
    var body: some View {
        ZStack {
            Image("body_1_skin_3")
                .resizable()
                .scaledToFit()
            
            if let selectedSkin = viewModel.selectedSkin {
                Image(selectedSkin.name) // Prioriza a cor da pele se selecionada
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if let selectedBody = viewModel.selectedBody {
                Image(selectedBody.name) // Mostra o corpo se não houver cor da pele selecionada
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            if let selectedHair = viewModel.selectedHair {
                Image(selectedHair.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            if let selectedBottom = viewModel.selectedBottom {
                Image(selectedBottom.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            if let selectedTop = viewModel.selectedTop {
                Image(selectedTop.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            if let selectedShoe = viewModel.selectedShoe {
                Image(selectedShoe.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            if let selectedOverlay = viewModel.selectedOverlay {
                Image(selectedOverlay.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct GridView: View {
    var options: [CharacterOption]
    var selectOption: (CharacterOption) -> Void
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(options) { option in
                        Button(action: {
                            selectOption(option)
                        }) {
                            VStack {
                                Image(option.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                            }
                        }
                    }
                }
                .padding(.horizontal, 40)
            }
            .frame(maxHeight: 290)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
