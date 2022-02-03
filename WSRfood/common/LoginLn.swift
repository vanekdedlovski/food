//
//  LoginLn.swift
//  WSRfood
//
//  Created by bnkwsr2 on 31.01.2022.
//

import SwiftUI

struct LoginLn: View {
    @Binding var screen : String
    @State var email = ""
    @EnvironmentObject var mainModule : MainModule
    @State var alert = false
    var body: some View {
        VStack {
            VStack {
                Image("cooking 1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 155, height: 155)
            }
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                    .offset(y: -50)
            )
            Spacer()
            VStack {
                VStack {
                    HStack {
                        Text("E-mail")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    TextField("",text: $mainModule.email, prompt: Text("E-mail"))
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 1)
                }
                
                VStack {
                    HStack {
                        Text("Password")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    SecureField("",text: $mainModule.password, prompt: Text("Password"))
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 1)
                }
                .padding(.top,15)
                HStack {
                    Button {
                        
                    } label: {
                        Text("Forgot password?")
                            .foregroundColor(Color("MyOrange"))
                            .font(.system(size: 17))
                    }
                    Spacer()
                }
                .padding(.top,40)
                .padding(.bottom,15)
                Button {
                    mainModule.Loginln {
                        screen = "MainScreen"
                    } error: {
                        alert = true
                    }

                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                        .frame(width: UIScreen.main.bounds.width - 40, height: 70)
                        .background(
                            Capsule()
                                .foregroundColor(Color("MyOrange"))
                            
                        )
                }


                Spacer()
            }
            .padding(.horizontal,20)
        }
        .alert(mainModule.error1, isPresented: $alert) {
            
        }
        .background(
         Color("Silver")
        )
    }
}

