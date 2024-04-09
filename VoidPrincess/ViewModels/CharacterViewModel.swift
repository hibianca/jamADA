//
//  CharacterViewModel.swift
//  VoidPrincess
//
//  Created by Bianca Nathally Bezerra de Lima on 09/04/24.
//

import Foundation

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
            
            options[.shoe] = [
                CharacterOption(name: "shoe_1", category: .shoe),
                CharacterOption(name: "shoe_2", category: .shoe),
                CharacterOption(name: "shoe_3", category: .shoe),
                CharacterOption(name: "shoe_4", category: .shoe)
            ]
            
            options[.overlay] = [
                CharacterOption(name: "glasses_1", category: .overlay),
                CharacterOption(name: "glasses_2", category: .overlay),
                CharacterOption(name: "piercing_1", category: .overlay),
                CharacterOption(name: "piercing_2", category: .overlay),
                CharacterOption(name: "piercing_3", category: .overlay),
                CharacterOption(name: "piercing_4", category: .overlay),
                CharacterOption(name: "piercing_5", category: .overlay)
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
            
            options[.shoe] = [
                CharacterOption(name: "shoe_1", category: .shoe),
                CharacterOption(name: "shoe_2", category: .shoe),
                CharacterOption(name: "shoe_3", category: .shoe),
                CharacterOption(name: "shoe_4", category: .shoe)
            ]
            
            options[.overlay] = [
                CharacterOption(name: "glasses_1", category: .overlay),
                CharacterOption(name: "glasses_2", category: .overlay),
                CharacterOption(name: "piercing_1", category: .overlay),
                CharacterOption(name: "piercing_2", category: .overlay),
                CharacterOption(name: "piercing_3", category: .overlay),
                CharacterOption(name: "piercing_4", category: .overlay),
                CharacterOption(name: "piercing_5", category: .overlay)
            ]
            
        default:
            break
        }
        
        self.objectWillChange.send()
    }
}
