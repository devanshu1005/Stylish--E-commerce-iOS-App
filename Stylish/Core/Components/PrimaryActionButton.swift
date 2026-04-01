import SwiftUI

struct PrimaryActionButton: View {
    
    let title: String
    var width: CGFloat? = nil
    var height: CGFloat = 55
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: width ?? .infinity)
                .frame(height: height)
                .background(Color(red: 248/255, green: 55/255, blue: 88/255))
                .cornerRadius(8)
        }
    }
}
