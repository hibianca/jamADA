//
//  CharacterView.swift
//  VoidPrincess
//
//  Created by Bianca Nathally Bezerra de Lima on 09/04/24.
//

import Foundation
import SwiftUI

struct CharacterView: View {
    @ObservedObject var viewModel: CharacterViewModel
    
    var body: some View {
        ZStack {
//            Image("body_1_skin_3")
//                .resizable()
//                .scaledToFit()
            
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
