//
//  fisrtScreen1.swift
//  WSRfood
//
//  Created by bnkwsr2 on 31.01.2022.
//

import SwiftUI

struct fisrtScreen1: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    @EnvironmentObject var networdCheck : NetwordCheck
    var body: some View {
        VStack {
            TabView {
                VStack {
                    Image("tab2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                    Text("Fastest Delivery 24/7")
                        .font(.system(size: 50))
                        .multilineTextAlignment(.center)
                }
                VStack {
                    Spacer()
                    Image("tab1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                    Spacer()
                    HStack {
                        Button {
                            withAnimation(.spring()) {
                                screen = "LoginLn"
                            }
                        } label: {
                            Text("Sign In")
                                .font(.custom("Italianno-Regular", size: 24))
                                .foregroundColor(.black)
                                .frame(width: 160, height: 70)
                                .background(
                                    Capsule()
                                        .foregroundColor(.white)
                                        
                                )
                        }
                        VStack {
                            Button {
                                withAnimation(.spring()) {
                                    screen = "RegisterLn"
                                }
                            } label: {
                                Text("Sign Up")
                                    .font(.custom("Italianno-Regular", size: 24))
                                    .foregroundColor(.black)
                                    .frame(width: 160, height: 70)
                                    .background(
                                        Capsule()
                                            .foregroundColor(.white)
                                            
                                    )
                            }
                        }
                       
                        

                    }
                    Spacer()
                    if (!networdCheck.IsConnected) {
                        Button {
                            withAnimation {
                                screen = "MainScreen"
                            }
                        } label: {
                            Text("Skip Authorization")
                                .foregroundColor(.black)
                        }
                    }
                }
                    
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .padding(.bottom,40)
            
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            .red
        )
    }
}

