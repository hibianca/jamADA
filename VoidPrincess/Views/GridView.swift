//
//  GridView.swift
//  VoidPrincess
//
//  Created by Bianca Nathally Bezerra de Lima on 09/04/24.
//

import Foundation
import SwiftUI

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
