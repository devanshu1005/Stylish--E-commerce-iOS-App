import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordHidden = true
    @State private var isLoading = false
    @State private var navigateToHome = false
    
    var body: some View {
        if navigateToHome {
            HomeView()
        } else {
            ZStack {
                mainContent
                
                if isLoading {
                    AppLoader(message: "Logging in...")
                }
            }
        }
    }
    
    var mainContent: some View {
        VStack(alignment: .leading) {
            
            Text("Welcome\nBack!")
                .font(.system(size: 36, weight: .bold))
                .padding(.top, 40)
                .padding(.horizontal)
            
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                
                TextField("Username or Email", text: $email)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 20)
            
            
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                
                if isPasswordHidden {
                    SecureField("Password", text: $password)
                } else {
                    TextField("Password", text: $password)
                }
                
                Button {
                    isPasswordHidden.toggle()
                } label: {
                    Image(systemName: isPasswordHidden ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 10)
            
            
            HStack {
                Spacer()
                
                Button("Forgot Password?") {
                    print("Forgot tapped")
                }
                .font(.system(size: 12))
                .foregroundColor(Color(.black))
            }
            .padding(.horizontal)
            .padding(.top, 5)
            
            
            PrimaryActionButton(title: "Login") {
                print("Login tapped")
                print("email: \(email)")
                print("password: \(password)")
                
                isLoading = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                    navigateToHome = true
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            
            HStack {
                Spacer()
                Text("- OR Continue with -")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.top, 30)
            
            
            HStack(spacing: 10) {
                
                SocialButton(image: "google") {
                      print("Google login")
                  }
                  
                  SocialButton(image: "apple") {
                      print("Apple login")
                  }
                  
                  SocialButton(image: "facebook") {
                      print("Facebook login")
                  }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 10)
            
            
            Spacer()
            
            
            HStack {
                Spacer()
                
                Text("Create An Account")
                    .foregroundColor(.gray)
                
                Button("Sign Up") {
                    print("Go to SignUp")
                }
                .foregroundColor(Color(.black)) 
                .underline()
                
                Spacer()
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    LoginView()
}
