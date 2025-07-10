//
//  SearchView.swift
//  edts-learning-custom-view
//
//  Created by Fauzan Sukmapratama on 25/06/25.
//

import SwiftUI

struct SearchView: View {
    @State var action: () -> Void = { }
    @State var text: String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        Search()
    }
    
    func Search() -> some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color.gray)
                .frame(width: 24, height: 24)
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 0))
            
            TextField("Search", text: $text)
                .foregroundColor(Color.secondary)
                .padding(.trailing, 8)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .focused($isFocused)
                .onSubmit {
                    action()
                }
            
            if (isFocused && text.count >= 1) {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color.gray)
                        .frame(width: 16, height: 16)
                        .padding(.trailing, 8)
                }
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 8).fill(Color.clear).stroke(isFocused ? Color.gray : Color.secondary, lineWidth: 1))
    }
}

#Preview {
    SearchView()
}

