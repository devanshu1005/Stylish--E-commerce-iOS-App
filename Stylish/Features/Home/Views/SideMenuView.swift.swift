import SwiftUI

struct SideMenuView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Hey, User")
                .font(.title2)
                .bold()
                .padding(.top, 50)
            
            menuItem(icon: "house", title: "Home")
            menuItem(icon: "heart", title: "Wishlist")
            menuItem(icon: "cart", title: "Cart")
            menuItem(icon: "gear", title: "Settings")
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
    }
    
    func menuItem(icon: String, title: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
            Text(title)
        }
        .font(.system(size: 16, weight: .medium))
    }
}
