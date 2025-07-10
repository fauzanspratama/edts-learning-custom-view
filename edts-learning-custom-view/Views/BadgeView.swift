////
////  BadgeView.swift
////  edts-learning-custom-view
////
////  Created by Fauzan Sukmapratama on 10/07/25.
////
//
//import SwiftUI
//
//// MARK: - Badge Variant Enum
//enum BadgeVariant {
//    case primary
//    case secondary
//    case tertiary
//    
//    var colors: (background: Color, text: Color) {
//        switch self {
//        case .primary:
//            return (.blue, .white)
//        case .secondary:
//            return (Color.blue.opacity(0.1), .blue)
//        case .tertiary:
//            return (.clear, .blue)
//        }
//    }
//    
//    var borderWidth: CGFloat {
//        switch self {
//        case .primary, .secondary:
//            return 0
//        case .tertiary:
//            return 1
//        }
//    }
//    
//    var borderColor: Color {
//        switch self {
//        case .primary, .secondary:
//            return .clear
//        case .tertiary:
//            return .blue
//        }
//    }
//}
//
//// MARK: - Custom Badge View
//struct CustomBadge: View {
//    let label: String
//    let variant: BadgeVariant
//    let icon: String?
//    let fontSize: CGFloat
//    let fontWeight: Font.Weight
//    let horizontalPadding: CGFloat
//    let verticalPadding: CGFloat
//    let cornerRadius: CGFloat
//    
//    init(
//        label: String,
//        variant: BadgeVariant = .primary,
//        icon: String? = nil,
//        fontSize: CGFloat = 12,
//        fontWeight: Font.Weight = .semibold,
//        horizontalPadding: CGFloat = 8,
//        verticalPadding: CGFloat = 4,
//        cornerRadius: CGFloat = 6
//    ) {
//        self.label = label
//        self.variant = variant
//        self.icon = icon
//        self.fontSize = fontSize
//        self.fontWeight = fontWeight
//        self.horizontalPadding = horizontalPadding
//        self.verticalPadding = verticalPadding
//        self.cornerRadius = cornerRadius
//    }
//    
//    var body: some View {
//        HStack(spacing: 4) {
//            if let icon = icon {
//                Image(systemName: icon)
//                    .font(.system(size: fontSize - 1, weight: fontWeight))
//                    .foregroundColor(variant.colors.text)
//            }
//            
//            Text(label)
//                .font(.system(size: fontSize, weight: fontWeight))
//                .foregroundColor(variant.colors.text)
//        }
//        .padding(.horizontal, horizontalPadding)
//        .padding(.vertical, verticalPadding)
//        .background(variant.colors.background)
//        .cornerRadius(cornerRadius)
//        .overlay(
//            RoundedRectangle(cornerRadius: cornerRadius)
//                .stroke(variant.borderColor, lineWidth: variant.borderWidth)
//        )
//        .lineLimit(1)
//    }
//}
//
//// MARK: - Badge Variations View
//struct BadgeVariationsView: View {
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 24) {
//                // Primary Badges
//                sectionView(title: "Primary Badges") {
//                    VStack(alignment: .leading, spacing: 12) {
//                        HStack(spacing: 8) {
//                            CustomBadge(label: "New", variant: .primary)
//                            CustomBadge(label: "Sale", variant: .primary, icon: "tag.fill")
//                            CustomBadge(label: "Trending", variant: .primary, icon: "arrow.up.right")
//                            CustomBadge(label: "Limited", variant: .primary, icon: "clock.fill")
//                        }
//                        
//                        HStack(spacing: 8) {
//                            CustomBadge(label: "Premium", variant: .primary, icon: "crown.fill")
//                            CustomBadge(label: "Featured", variant: .primary, icon: "star.fill")
//                            CustomBadge(label: "Hot", variant: .primary, icon: "flame.fill")
//                        }
//                    }
//                }
//                
//                // Secondary Badges
//                sectionView(title: "Secondary Badges") {
//                    VStack(alignment: .leading, spacing: 12) {
//                        HStack(spacing: 8) {
//                            CustomBadge(label: "Info", variant: .secondary)
//                            CustomBadge(label: "Draft", variant: .secondary, icon: "doc.text")
//                            CustomBadge(label: "Pending", variant: .secondary, icon: "clock")
//                            CustomBadge(label: "Review", variant: .secondary, icon: "eye")
//                        }
//                        
//                        HStack(spacing: 8) {
//                            CustomBadge(label: "Beta", variant: .secondary, icon: "flask")
//                            CustomBadge(label: "Coming Soon", variant: .secondary, icon: "calendar")
//                            CustomBadge(label: "Updated", variant: .secondary, icon: "arrow.clockwise")
//                        }
//                    }
//                }
//                
//                // Tertiary Badges
//                sectionView(title: "Tertiary Badges") {
//                    VStack(alignment: .leading, spacing: 12) {
//                        HStack(spacing: 8) {
//                            CustomBadge(label: "Optional", variant: .tertiary)
//                            CustomBadge(label: "Learn More", variant: .tertiary, icon: "info.circle")
//                            CustomBadge(label: "External", variant: .tertiary, icon: "arrow.up.right.square")
//                            CustomBadge(label: "Download", variant: .tertiary, icon: "arrow.down.circle")
//                        }
//                        
//                        HStack(spacing: 8) {
//                            CustomBadge(label: "Settings", variant: .tertiary, icon: "gear")
//                            CustomBadge(label: "Share", variant: .tertiary, icon: "square.and.arrow.up")
//                            CustomBadge(label: "Bookmark", variant: .tertiary, icon: "bookmark")
//                        }
//                    }
//                }
//                
//                // Custom Color Examples
//                sectionView(title: "Different Colors") {
//                    VStack(alignment: .leading, spacing: 12) {
//                        HStack(spacing: 8) {
//                            customColorBadge(label: "Success", color: .green)
//                            customColorBadge(label: "Warning", color: .orange, icon: "exclamationmark.triangle.fill")
//                            customColorBadge(label: "Error", color: .red, icon: "xmark.circle.fill")
//                            customColorBadge(label: "Purple", color: .purple, icon: "heart.fill")
//                        }
//                    }
//                }
//                
//                // Size Variations
//                sectionView(title: "Size Variations") {
//                    VStack(alignment: .leading, spacing: 12) {
//                        HStack(spacing: 8) {
//                            CustomBadge(label: "Small", variant: .primary, fontSize: 10)
//                            CustomBadge(label: "Medium", variant: .primary)
//                            CustomBadge(label: "Large", variant: .primary, fontSize: 14)
//                        }
//                        
//                        HStack(spacing: 8) {
//                            CustomBadge(label: "Small", variant: .primary, icon: "star.fill", fontSize: 10)
//                            CustomBadge(label: "Medium", variant: .primary, icon: "star.fill")
//                            CustomBadge(label: "Large", variant: .primary, icon: "star.fill", fontSize: 14)
//                        }
//                    }
//                }
//            }
//            .padding()
//        }
//        .navigationTitle("Badge Variations")
//    }
//    
//    private func sectionView<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
//        VStack(alignment: .leading, spacing: 8) {
//            Text(title)
//                .font(.headline)
//                .foregroundColor(.primary)
//            
//            content()
//        }
//    }
//    
//    private func customColorBadge(label: String, color: Color, icon: String? = nil) -> some View {
//        HStack(spacing: 4) {
//            if let icon = icon {
//                Image(systemName: icon)
//                    .font(.system(size: 11, weight: .semibold))
//                    .foregroundColor(.white)
//            }
//            
//            Text(label)
//                .font(.system(size: 12, weight: .semibold))
//                .foregroundColor(.white)
//        }
//        .padding(.horizontal, 8)
//        .padding(.vertical, 4)
//        .background(color)
//        .cornerRadius(6)
//        .lineLimit(1)
//    }
//}
//
//// MARK: - Preview
//struct BadgeVariationsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            BadgeVariationsView()
//        }
//    }
//}
