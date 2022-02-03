//
//  RegisterLn.swift
//  WSRfood
//
//  Created by bnkwsr2 on 31.01.2022.
//

import SwiftUI

struct RegisterLn: View {
    @Binding var screen : String
    @State var email = ""
    @State var alert = false
    @EnvironmentObject var mainModule : MainModule
    var body: some View {
        VStack {
            VStack {
                Image("cooking 1")
                    .resizable()
                    .offset(y: -25)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 155, height: 155)
            }
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3.5)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                    .offset(y: -50)
            )
            Spacer()
            VStack {
                VStack(spacing: 30) {
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
                    
                    VStack {
                        HStack {
                            Text("Full name")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        TextField("",text: $mainModule.firstName, prompt: Text("Name"))
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 1)
                    }
                    VStack {
                        HStack {
                            Text("Phone")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        TextField("",text: $mainModule.phone, prompt: Text("Phone"))
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 1)
                    }
                }
                .padding(.bottom,40)
                
                VStack(spacing: 20) {
                    Button {
                        mainModule.RegisterLn {
                            withAnimation(.spring()) {
                                screen = "MainScreen"
                                
                            }
                        } error: {
                            alert = true
                        }

                    } label: {
                        Text("Register Now")
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                            .frame(width: UIScreen.main.bounds.width - 40, height: 70)
                            .background(
                                Capsule()
                                    .foregroundColor(Color("MyOrange"))
                                
                            )
                    }
                    Button {
                        withAnimation {
                            screen = "firstScreen1"
                        }
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                            .frame(width: UIScreen.main.bounds.width - 40, height: 70)
                            .background(
                                Capsule()
                                    .foregroundColor(Color("MyOrange"))
                                
                            )
                    }
                }


                Spacer()
            }
            .padding(.horizontal,20)
        }
        .background(
         Color("Silver")
        )
        .alert(mainModule.error1, isPresented: $alert) {
            
        }
    }
}
