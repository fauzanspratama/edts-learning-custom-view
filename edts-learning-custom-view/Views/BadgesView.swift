//
//  BadgesView.swift
//  edts-learning-custom-view
//
//  Created by Fauzan Sukmapratama on 10/07/25.
//

import SwiftUI

// MARK: - Badge Size Properties
private let badgeFontSize: CGFloat = 14
private let badgeHorizontalPadding: CGFloat = 8
private let badgeVerticalPadding: CGFloat = 4
private let badgeCornerRadius: CGFloat = 6

// MARK: - Badge Variant Enum
enum BadgeVariant {
    case primary
    case secondary
    case tertiary
    
    func colors(for color: BadgeColor) -> (background: Color, text: Color) {
        switch self {
        case .primary:
            return (color.primaryBackground, color.primaryText)
        case .secondary:
            return (color.secondaryBackground, color.secondaryText)
        case .tertiary:
            return (color.tertiaryBackground, color.tertiaryText)
        }
    }
    
    func borderWidth(for color: BadgeColor) -> CGFloat {
        switch self {
        case .primary, .secondary:
            return 0
        case .tertiary:
            return 1
        }
    }
    
    func borderColor(for color: BadgeColor) -> Color {
        switch self {
        case .primary, .secondary:
            return .clear
        case .tertiary:
            return color.tertiaryBorder
        }
    }
}

// MARK: - Badge Color Enum
enum BadgeColor {
    case green
    case orange
    case red
    case gray
    
    var primaryBackground: Color {
        switch self {
        case .green: return .green
        case .orange: return .orange
        case .red: return .red
        case .gray: return .gray
        }
    }
    
    var primaryText: Color {
        return .white
    }
    
    var secondaryBackground: Color {
        switch self {
        case .green: return .green.opacity(0.1)
        case .orange: return .orange.opacity(0.1)
        case .red: return .red.opacity(0.1)
        case .gray: return .gray.opacity(0.1)
        }
    }
    
    var secondaryText: Color {
        switch self {
        case .green: return .green
        case .orange: return .orange
        case .red: return .red
        case .gray: return .gray
        }
    }
    
    var tertiaryBackground: Color {
        return .clear
    }
    
    var tertiaryText: Color {
        return secondaryText
    }
    
    var tertiaryBorder: Color {
        return secondaryText
    }
}

// MARK: - Custom Badge View
struct CustomBadge: View {
    let label: String
    let variant: BadgeVariant
    let color: BadgeColor
    let icon: String?
    let fontWeight: Font.Weight
    
    init(
        label: String,
        variant: BadgeVariant = .primary,
        color: BadgeColor = .green,
        icon: String? = nil,
        fontWeight: Font.Weight = .semibold
    ) {
        self.label = label
        self.variant = variant
        self.color = color
        self.icon = icon
        self.fontWeight = fontWeight
    }
    
    var body: some View {
        HStack(spacing: 4) {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(size: badgeFontSize - 1, weight: fontWeight))
                    .foregroundColor(variant.colors(for: color).text)
            }
            
            Text(label)
                .font(.system(size: badgeFontSize, weight: fontWeight))
                .foregroundColor(variant.colors(for: color).text)
        }
        .padding(.horizontal, badgeHorizontalPadding)
        .padding(.vertical, badgeVerticalPadding)
        .background(variant.colors(for: color).background)
        .cornerRadius(badgeCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: badgeCornerRadius)
                .stroke(variant.borderColor(for: color), lineWidth: variant.borderWidth(for: color))
        )
        .lineLimit(1)
    }
}

// MARK: - Badge Variations View
struct BadgeVariationsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Primary Badges
                sectionView(title: "Badges") {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            CustomBadge(label: "Special Offers", variant: .primary, color: .green)
                            CustomBadge(label: "Special Offers", variant: .primary, color: .orange)
                            CustomBadge(label: "Special Offers", variant: .primary, color: .red)
                            CustomBadge(label: "Special Offers", variant: .primary, color: .gray)
                        }
                        
                        HStack(spacing: 8) {
                            CustomBadge(label: "Special Offers", variant: .secondary, color: .green)
                            CustomBadge(label: "Special Offers", variant: .secondary, color: .orange)
                            CustomBadge(label: "Special Offers", variant: .secondary, color: .red)
                            CustomBadge(label: "Special Offers", variant: .secondary, color: .gray)
                        }
                        
                        HStack(spacing: 8) {
                            CustomBadge(label: "Special Offers", variant: .tertiary, color: .green)
                            CustomBadge(label: "Special Offers", variant: .tertiary, color: .orange)
                            CustomBadge(label: "Special Offers", variant: .tertiary, color: .red)
                            CustomBadge(label: "Special Offers", variant: .tertiary, color: .gray)
                        }
                        
                        
                    }
                }
                
                // With Tag Icons
                sectionView(title: "With Tag Icons") {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            CustomBadge(label: "Special Offers", variant: .primary, color: .green, icon: "tag.fill")
                            CustomBadge(label: "Special Offers", variant: .primary, color: .orange, icon: "tag.fill")
                            CustomBadge(label: "Special Offers", variant: .primary, color: .red, icon: "tag.fill")
                            CustomBadge(label: "Special Offers", variant: .primary, color: .gray, icon: "tag.fill")
                        }
                        
                        HStack(spacing: 8) {
                            CustomBadge(label: "Special Offers", variant: .secondary, color: .green, icon: "tag.fill")
                            CustomBadge(label: "Special Offers", variant: .secondary, color: .orange, icon: "tag.fill")
                            CustomBadge(label: "Special Offers", variant: .secondary, color: .red, icon: "tag.fill")
                            CustomBadge(label: "Special Offers", variant: .secondary, color: .gray, icon: "tag.fill")
                        }
                        
                        HStack(spacing: 8) {
                            CustomBadge(label: "Special Offers", variant: .tertiary, color: .green, icon: "tag.fill")
                            CustomBadge(label: "Special Offers", variant: .tertiary, color: .orange, icon: "tag.fill")
                            CustomBadge(label: "Special Offers", variant: .tertiary, color: .red, icon: "tag.fill")
                            CustomBadge(label: "Special Offers", variant: .tertiary, color: .gray, icon: "tag.fill")
                        }
                    }
                }
                
                
                // Different Labels
                sectionView(title: "Different Labels") {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            CustomBadge(label: "New", variant: .primary, color: .green)
                            CustomBadge(label: "Sale", variant: .primary, color: .orange, icon: "tag.fill")
                            CustomBadge(label: "Trending", variant: .secondary, color: .red, icon: "arrow.up.right")
                            CustomBadge(label: "Limited", variant: .tertiary, color: .gray, icon: "clock")
                        }
                        
                        HStack(spacing: 8) {
                            CustomBadge(label: "Premium", variant: .primary, color: .green, icon: "crown.fill")
                            CustomBadge(label: "Featured", variant: .secondary, color: .orange, icon: "star.fill")
                            CustomBadge(label: "Hot", variant: .tertiary, color: .red, icon: "flame.fill")
                            CustomBadge(label: "Beta", variant: .primary, color: .gray, icon: "flask")
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Badge Variations")
    }
    
    private func sectionView<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            
            content()
        }
    }
}

// MARK: - Preview
struct BadgeVariationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BadgeVariationsView()
        }
    }
}
