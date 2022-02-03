//
//  OneItemScreen.swift
//  WSRfood
//
//  Created by bnkwsr2 on 01.02.2022.
//

import SwiftUI
import Kingfisher

struct OneItemScreen: View {
    @Binding var screen : String
    @Binding var currentDish : Dishes?
    var body: some View {
        VStack {
            HStack {
                Button {
                    screen = "MainScreen"
                } label: {
                    Text("<")
                        .foregroundColor(.black)
                }
                Spacer()

            }
            .padding(.horizontal,25)
            VStack {
                TabView {
                    KFImage(URL(string: "http://food.madskill.ru/up/images/\(currentDish?.icon ?? "")"))
                        .resizable()
                        .frame(width: 250, height: 250)
                    KFImage(URL(string: "http://food.madskill.ru/up/images/\(currentDish?.icon ?? "")"))
                        .resizable()
                        .frame(width: 250, height: 250)
                    KFImage(URL(string: "http://food.madskill.ru/up/images/\(currentDish?.icon ?? "")"))
                        .resizable()
                        .frame(width: 250, height: 250)
                    KFImage(URL(string: "http://food.madskill.ru/up/images/\(currentDish?.icon ?? "")"))
                        .resizable()
                        .frame(width: 250, height: 250)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                Spacer()
                Text("\(currentDish?.nameDish ?? "")")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 24))
               
                Text("N\(currentDish?.price ?? "")")
                    .foregroundColor(Color("MyOrange"))
                    .font(.system(size: 20))
                    .padding(.top,15)
                
                VStack {
                    HStack {
                        Text("Delivery info")
                        Spacer()
                    }
                    .padding(.top,15)
                    Text("Delivered between monday aug and thursday 20 from 8pm to 91:32 pm")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                }
                .padding(.leading,20)
                .padding(.top,35)
                Spacer()
                Button {
                    
                } label: {
                    Text("Add to cart")
                        .foregroundColor(.white)
                        .frame(width: 320, height: 75)
                        .background(
                            Capsule()
                                .foregroundColor(Color("MyOrange"))
                        )
                }

                Spacer()
            }
            Spacer()
        }
    }
}
