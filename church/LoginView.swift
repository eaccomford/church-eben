//
//  LoginView.swift
//  church
//
//  Created by PK on 05/02/2021.
//

import SwiftUI
import Introspect

struct LoginView: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Home()
        //            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct Home: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var login: Bool = false
    @State var uiTabarController: UITabBarController?
    
    var body: some View{
        if login{
            DashboardView()
        }
        VStack{
                VStack{
                    VStack{
                        Text("Christ Embassy")
                            .foregroundColor(.blue)
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        Image("logo-eben").resizable()
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(100)
                        Text("Instant Cell Report")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                    }
                    .padding(.top, 40)
                    
                    VStack{
                        HStack{
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.black)
                            TextField("Email Address", text: self.$email).foregroundColor(.blue)
                        }
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    VStack{
                        HStack{
                            Image(systemName: "eye.slash.fill")
                                .foregroundColor(.black)
                            TextField("Password", text: self.$password)
                            
                        }
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    HStack{
                        Spacer()
                        Button(action:  {
                            login = true
                            print("Login")
                        }){
                            Image(systemName: "lock.open.fill").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                            Text("Login")
                                .foregroundColor(.white)
                            
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: .top, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        .cornerRadius(40)
                        .padding(.horizontal,20)
                        .navigationBarHidden(true) // remove navbar header space
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    .padding(.bottom, 40)
                    
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .topLeading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .edgesIgnoringSafeArea(.top) // bg cover full screen
            }
        
        .introspectTabBarController { (UITabBarController) in
                    UITabBarController.tabBar.isHidden = true
                    uiTabarController = UITabBarController
                }
//               .onDisappear{
//                    uiTabarController?.tabBar.isHidden = false
//                }
//        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
    }
}
