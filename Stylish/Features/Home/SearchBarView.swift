import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 10) {
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.gray.opacity(0.7))
      
            TextField("Search any Product..", text: $text)
                .font(.system(size: 14))
            
            Spacer()
            
            Image(systemName: "mic.fill")
                .foregroundColor(Color.gray.opacity(0.7))
        }
        .padding(.horizontal, 12)
        .frame(height: 40)
        .background(Color.white)
        .cornerRadius(6)
        .shadow(color: Color.black.opacity(0.04), radius: 9, y: 2)
    }
}

#Preview {
    SearchBarView(text: .constant(""))
        .padding()
}
