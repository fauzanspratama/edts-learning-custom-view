//
//  TextFieldView.swift
//  edts-learning-custom-view
//
//  Created by Fauzan Sukmapratama on 10/07/25.
//

import SwiftUI

import SwiftUI

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    @State private var isEditing = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Text field background and border
            TextField("", text: $text)
                .focused($isFocused)
                .padding(.horizontal, 12)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(isFocused ? Color.blue : Color.gray, lineWidth: isFocused ? 2 : 1)
                )
                .onChange(of: isFocused) { focused in
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        isEditing = focused
                    }
                }
            
            // Animated label
            Text(title)
                .font(.system(size: isEditing || !text.isEmpty ? 12 : 16))
                .foregroundColor(isFocused ? .blue : .gray)
                .padding(.horizontal, 4)
                .background(Color(.systemBackground))
                .padding(.horizontal, 8)
                .offset(
                    x: 0,
                    y: isEditing || !text.isEmpty ? -26 : 0
                )
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isEditing || !text.isEmpty)
            
            // Clear button
            if !text.isEmpty {
                HStack {
                    Spacer()
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(8)
                    }
                    .padding(.trailing, 8)
                }
            }
        }
        .frame(height: 56)
        .padding(.top, 8)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // Empty state
            CustomTextField(title: "Email", text: .constant(""))
                .padding(.horizontal)
            
            // Filled state
            CustomTextField(title: "Email", text: .constant("john.doe@example.com"))
                .padding(.horizontal)
            
            // Interactive demo
            StatefulPreview()
        }
        .padding()
    }
    
    struct StatefulPreview: View {
        @State private var text = ""
        
        var body: some View {
            VStack {
                CustomTextField(title: "Username", text: $text)
                    .padding(.horizontal)
                
                Text("Current value: \(text)")
                    .padding()
            }
        }
    }
}
