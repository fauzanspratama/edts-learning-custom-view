import SwiftUI

// MARK: - Simple Chip Model
struct Chip: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    var isSelected: Bool = false
}

// MARK: - Custom Chip View
struct CustomChipView: View {
    let title: String
    let icon: String
    @Binding var isSelected: Bool
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.body)
            Text(title)
                .font(.body)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(isSelected ? Color.blue : Color.gray.opacity(0.1))
        .foregroundColor(isSelected ? .white : .blue)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

// MARK: - Main Content View
struct ContentChipView: View {
    @State private var chips = [
        Chip(title: "Heart", icon: "heart"),
        Chip(title: "Star", icon: "star"),
        Chip(title: "Book", icon: "book"),
        Chip(title: "Music", icon: "music.note"),
        Chip(title: "Phone", icon: "phone"),
        Chip(title: "Mail", icon: "envelope"),
        Chip(title: "Map", icon: "map")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 8) {
                    ForEach(chips.indices, id: \.self) { index in
                        CustomChipView(
                            title: chips[index].title,
                            icon: chips[index].icon,
                            isSelected: $chips[index].isSelected
                        )
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentChipView()
}
