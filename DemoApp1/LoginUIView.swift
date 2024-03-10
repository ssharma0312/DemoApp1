import SwiftUI

struct LoginUIView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: "5cb270").opacity(0.9), Color(hex: "f4f269").opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.7), Color.white.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(height: 300)
                            .padding(.horizontal, 10)
                            .shadow(radius: 10)
                            .overlay(alignment: .center, content: {
                                VStack {
                                    Spacer()
                                    Text("RentVista").font(.title)
                                        .foregroundColor(Color(hex: "#006400"))
                                    Text("Find local houses for rent").font(.subheadline)
                                        .foregroundColor(Color(hex: "#006400"))
                                    Spacer()
                                    TextField("Username", text: $username)
                                        .padding()
                                        .background(Color.white.opacity(0.5))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 20)
                                    
                                    SecureField("Password", text: $password)
                                        .padding()
                                        .background(Color.white.opacity(0.5))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 20)
                                    
                                    NavigationLink("Login") {
                                        ListUIView().navigationBarBackButtonHidden(true)
                                    }
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green)
                                    .cornerRadius(10)
                                    .padding()
                                    Spacer()
                                }
                            })
                    }
                    
                    Spacer()
                    
                }
            }
            
            
            
        }
    }
}

struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView()
    }
}

extension Color {
    init(hex: String) {
        var hex = hex
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
