//
//  OrderPlaceHolder.swift
//  WSRfood
//
//  Created by bnkwsr2 on 02.02.2022.
//

import SwiftUI
import Kingfisher
import SwiftLocation

struct OrderPlaceHolder: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    @Binding var currentDish : Dishes?
    @Binding var isUsed : String
    @Binding var isUsed1 : String
    @Binding var cart : [Dishes]
    @State var priceOrder : Int = 0
   
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Order")
                    .padding(.trailing,10)
                   
                
                    .font(.custom("Italianno-Regular", size: 36))
                    .foregroundColor(.black)
                    .padding(.trailing,15)
                    
                    
                   
                Spacer()
                Text("4th Avenue, 76")
                    .foregroundColor(.gray)
                Spacer()
                Image("location")
                Spacer()
            }
            Spacer()
            if (cart.count == 0) {
                VStack {
                    Image("cartOrder")
                    Text("No orders yet")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 24))
                    
                }
            }
            
            if (cart.count != 0) {
                VStack(spacing: 25) {
                    ForEach(cart, id: \.dishId) { item in
                        HStack {
                            Spacer()
                            VStack {
                                KFImage(URL(string: "http://food.madskill.ru/up/images/\(item.icon ?? "")"))
                                    .resizable()
                                    .frame(width: 150, height: 80)
                                    .cornerRadius(45)
                            }
                            
                            VStack(alignment: .center) {
                                Text("**\(item.nameDish ?? "")**")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 12))
                                    .lineLimit(3)
                                    
                                Text("N\(item.price ?? "")")
                                    .foregroundColor(Color("MyOrange"))
                                    .font(.system(size: 10))
                                    .padding(.top,5)
                                HStack {
                                    Button {
//                                        cart.filter{ $0.dishId == item.dishId }.first!.count! = 1
                                    } label: {
                                        Text("-")
                                            .foregroundColor(.black)
                                            .frame(width: 28, height: 28)
                                            .background(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .foregroundColor(.gray)
                                            )
                                    }

                                    Text("\(item.count ?? 0)")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                    Button {
                                       
                                    } label: {
                                        Text("+")
                                            .foregroundColor(.black)
                                            .frame(width: 28, height: 28)
                                            .background(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .foregroundColor(.gray)
                                            )
                                    }
                                }
                            }
                            .padding(.horizontal,10)
                            Spacer()
                            
                                
                        }
                     
                        
                    }
                    VStack {
                        HStack {
                            Text("Дополнительно")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                            Spacer()
                        }
                        .padding(.leading,30)
                        ScrollView(.horizontal) {
                            HStack {
                                VStack {
                                    Image("imageDop")
                                        .resizable()
                                        .frame(width: 160, height: 70)
                                        .cornerRadius(20)
                                    HStack{
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 13))
                                        Text("200")
                                            .frame(width: 30, height: 15)
                                            .font(.system(size: 13))
                                            .background(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .foregroundColor(Color(.gray))
                                            )
                                    }
                                }
                                VStack {
                                    Image("imageDop")
                                        .resizable()
                                        .frame(width: 160, height: 70)
                                        .cornerRadius(20)
                                    HStack{
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 13))
                                        Text("200")
                                            .frame(width: 30, height: 15)
                                            .font(.system(size: 13))
                                            .background(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .foregroundColor(Color(.gray))
                                            )
                                    }
                                }
                                VStack {
                                    Image("imageDop")
                                        .resizable()
                                        .frame(width: 160, height: 70)
                                        .cornerRadius(20)
                                    HStack{
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 13))
                                        Text("200")
                                            .frame(width: 30, height: 15)
                                            .font(.system(size: 13))
                                            .background(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .foregroundColor(Color(.gray))
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal,30)
                        HStack {
                            Text("Соусы")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                            Spacer()
                        }
                        .padding(.leading,30)
                        ScrollView(.horizontal) {
                            HStack {
                                VStack {
                                    Image("imageDop")
                                        .resizable()
                                        .frame(width: 160, height: 70)
                                        .cornerRadius(20)
                                    HStack{
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 13))
                                        Text("200")
                                            .frame(width: 30, height: 15)
                                            .font(.system(size: 13))
                                            .background(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .foregroundColor(Color(.gray))
                                            )
                                    }
                                }
                                VStack {
                                    Image("imageDop")
                                        .resizable()
                                        .frame(width: 160, height: 70)
                                        .cornerRadius(20)
                                    HStack{
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 13))
                                        Text("200")
                                            .frame(width: 30, height: 15)
                                            .font(.system(size: 13))
                                            .background(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .foregroundColor(Color(.gray))
                                            )
                                    }
                                }
                                VStack {
                                    Image("imageDop")
                                        .resizable()
                                        .frame(width: 160, height: 70)
                                        .cornerRadius(20)
                                    HStack{
                                        Text("Veggie tomato mix")
                                            .font(.system(size: 13))
                                        Text("200")
                                            .frame(width: 30, height: 15)
                                            .font(.system(size: 13))
                                            .background(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .foregroundColor(Color(.gray))
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.horizontal,30)
                    }
                    VStack {
                        HStack {
                            Text("Order Price")
                                .padding(.leading,20)
                                .foregroundColor(.white)
                            Spacer()
                            Text("\(priceOrder)$$")
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal,5)
                        
                    }
                    .frame(width: 316, height: 45)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color("MyOrange"))
                            .opacity(0.6)
                    )
                    Button {
                        
                    } label: {
                        Text("Order Now")
                            .frame(width: 320, height: 70)
                            .foregroundColor(.white)
                            .background(
                                Capsule()
                                    .foregroundColor(Color("MyOrange"))
                            )
                    }


                    Spacer()
                }
            }
            
            Spacer()
        }
        
        .onAppear {
            for cartItem in cart {
                priceOrder = priceOrder + (Int(cartItem.price) ?? 0) * (cartItem.count ?? 0)
            }
        }
        .onAppear(perform: {
            mainModule.getVersion {
                mainModule.getDishes {
                    print(123)
                }
            }
        })
        
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

