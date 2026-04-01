import SwiftUI

struct SocialButton: View {
    
    let image: String
    var size: CGFloat = 54
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 54, height: 54)
                .frame(width: size, height: size)
                .overlay(
                    Circle()
                        .stroke(lineWidth: 1)
                )
                .clipShape(Circle())
        }
    }
}

#Preview {
    SocialButton(image: "google", size: 54, action: { print("google button pressed") })
}
