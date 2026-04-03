
import SwiftUI

struct HomeNavBar: View {
    
    var onMenuTap: () -> Void
    
    var body: some View {
        HStack {
            
            // 🔘 Left Menu Button
            Button {
                onMenuTap()  
            } label: {
                ZStack {
                    Circle()
                        .fill(Color(.systemGray5))
                        .frame(width: 36, height: 36)
                    
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.black)
                }
            }
            
            
            Spacer()
            
            
            Image("SplashLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            
            Spacer()
            
            
            // 👤 Profile Image
            Image("profile") // add your asset
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
        .padding(.horizontal)
        .frame(height: 56)
        .background(Color.white)
    }
}

//#Preview {
//    HomeNavBar()
//}
