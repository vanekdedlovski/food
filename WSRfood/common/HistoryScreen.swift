//
//  HistoryScreen.swift
//  WSRfood
//
//  Created by bnkwsr2 on 02.02.2022.
//

import SwiftUI

struct HistoryScreen: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    @Binding var currentDish : Dishes?
    @Binding var isUsed : String
    @Binding var isUsed1 : String
    @Binding var cart : [Dishes]
    var body: some View {
        VStack {
            Text("123")
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 80)
        .background(
            Color("Silver")
        )
        .overlay(
            HStack {
                Spacer()
                Button {
                    isUsed1 = "home"
                    screen = "MainScreen"
                } label: {
                    Image(isUsed1 != "home" ? "home" : "homeUsed")
                        .resizable()
                        .frame(width: 25, height: 25)
                        
                }
                Spacer()
                Button {
                    withAnimation {
                        isUsed1 = "cart"
                        screen = "OrderPlaceHolder"
                    }
                } label: {
                    Image(isUsed1 != "cart" ? "cart" : "cartUsed")
                        .resizable()
                        .frame(width: 25, height: 25)
                        
                }
                Spacer()
                Button {
                    isUsed1 = "profile"
                } label: {
                    Image(isUsed1 != "profile" ? "profile" : "profileUsed")
                        .resizable()
                        .frame(width: 25, height: 25)
                        
                }
                Spacer()
                Button {
                    withAnimation {
                        isUsed1 = "history"
                        screen = "HistoryScreen"
                    }
                } label: {
                    Image(isUsed1 != "history" ? "history" : "historyUsed")
                        .resizable()
                        .frame(width: 25, height: 25)
                        
                }
                
                Spacer()

            }
                .background(
                 Color("Silver")
                    .frame(width: UIScreen.main.bounds.width, height: 50)
                )
            , alignment: .bottom
        )
    }
}


