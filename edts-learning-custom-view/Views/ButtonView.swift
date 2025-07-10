//
//  ButtonView.swift
//  edts-learning-custom-view
//
//  Created by Fauzan Sukmapratama on 10/07/25.
//

import SwiftUI

// MARK: - Simple Button Component
struct CustomButton: View {
    let title: String
    let variant: ButtonVariant
    let icon: String?
    let iconPosition: IconPosition
    let action: () -> Void
    
    @State private var isPressed = false
    
    enum ButtonVariant {
        case primary
        case secondary
    }
    
    enum IconPosition {
        case leading
        case trailing
    }
    
    // Simple constructors
    init(_ title: String, variant: ButtonVariant = .primary, action: @escaping () -> Void) {
        self.title = title
        self.variant = variant
        self.icon = nil
        self.iconPosition = .leading
        self.action = action
    }
    
    init(_ title: String, variant: ButtonVariant = .primary, icon: String, iconPosition: IconPosition = .leading, action: @escaping () -> Void) {
        self.title = title
        self.variant = variant
        self.icon = icon
        self.iconPosition = iconPosition
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let icon = icon, iconPosition == .leading {
                    Image(systemName: icon)
                }
                
                Text(title)
                
                if let icon = icon, iconPosition == .trailing {
                    Image(systemName: icon)
                }
            }
            .font(.system(size: 16, weight: .medium))
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(variant == .primary ? .blue : .clear)
            .foregroundColor(variant == .primary ? .white : .blue)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(.blue, lineWidth: variant == .secondary ? 1 : 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .opacity(isPressed ? 0.8 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity) {
            // Action handled by Button
        } onPressingChanged: { pressing in
            isPressed = pressing
        }
    }
}

// MARK: - Usage Example
struct ButtonVariantView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Simple Button Examples")
                .font(.title)
                .fontWeight(.bold)
            
            CustomButton("Primary Button") {
                print("Primary tapped")
            }
            
            CustomButton("Secondary Button", variant: .secondary) {
                print("Secondary tapped")
            }
            
            CustomButton("With Icon", icon: "star.fill") {
                print("Star tapped")
            }
            
            CustomButton("Trailing Icon", icon: "arrow.right", iconPosition: .trailing) {
                print("Arrow tapped")
            }
            
            CustomButton("Delete", variant: .secondary, icon: "trash") {
                print("Delete tapped")
            }
        }
        .padding()
    }
}

#Preview {
    ButtonVariantView()
}
