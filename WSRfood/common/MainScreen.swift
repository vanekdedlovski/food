//
//  MainScreen.swift
//  WSRfood
//
//  Created by bnkwsr2 on 31.01.2022.
//

import SwiftUI
import Kingfisher
import GoogleMobileAds

struct MainScreen: View {
    @Binding var screen : String
    @EnvironmentObject var mainModule : MainModule
    @State var poiskAdress = ""
    @State var search = ""
    @Binding var isUsed : String
    @Binding var isUsed1 : String
    @State var columns: [GridItem] = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 2 - 50), spacing:16)]
    @State var IsActiveSearch = false
    @State var dishes : [Dishes] = []
    @State var currentFoods : [Dishes] = []
    @Binding var currentDish : Dishes?
    @State var number : Int = 0
    @State var IsUsedAddCart = false
    @Binding var cart : [Dishes]
    @State var alert = false
    @State var alertMessage = ""
    @Binding var street : String
    var body: some View {
        VStack{
            if (IsActiveSearch) {
                HStack {
                    TextField("", text: $search ,prompt: Text("'Search'"))
                        .frame(width: 240)
                        .onChange(of: search) { newValue in
                            dishes = mainModule.Disheds.filter { $0.nameDish.contains(newValue) }
                        }
                    Button {
                        withAnimation {
                            IsActiveSearch = false
                        }
                    } label: {
                        Image("cancel")
                    }
                    Button {
                        
                    } label: {
                        Image("lupa")
                    }

                   
                }
                .background(
                    Capsule()
                        .foregroundColor(.white)
                        .frame(width: 350, height: 42)
                )
                .padding(.horizontal,15)
            }
            if (!IsActiveSearch) {
                HStack {
                    TextField("", text: $poiskAdress, prompt: Text("Выберите адрес доставки"))
                    Button {
                        poiskAdress = street
                    } label: {
                        Image("location")
                    }

                    Spacer()
                    Button {
                        withAnimation {
                            IsActiveSearch = true
                        }
                    } label: {
                        Image("lupa")
                    }

                }
                .padding(.horizontal,25)
            }
            if (IsActiveSearch) {
                HStack {
                    Text("Result")
                        .font(.custom("Italianno-Regular", size: 36))
                        .fontWeight(.heavy)
                    Spacer()
                }
                .padding(.horizontal,25)
            } else {
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.spring()) {
                            isUsed = "Foods"
                            currentFoods = mainModule.Disheds.filter{$0.category == "Foods"}
                        }
                    } label: {
                        VStack {
                            Text("Foods")
                                .foregroundColor(isUsed == "Foods" ?  Color("MyOrange") : .gray)
                            Rectangle()
                                .foregroundColor(isUsed == "Foods" ?  Color("MyOrange") : Color.clear)
                                .frame(width: 60, height: 2)
                        }
                    }
                    Spacer()
                    Button {
                        withAnimation {
                            isUsed = "Drinks"
                            currentFoods = mainModule.Disheds.filter{$0.category == "Drinks"}
                        }
                    } label: {
                        VStack {
                            Text("Drinks")
                                .foregroundColor(isUsed == "Drinks" ?  Color("MyOrange") : .gray)
                            Rectangle()
                                .foregroundColor(isUsed == "Drinks" ?  Color("MyOrange") : Color.clear)
                                .frame(width: 60, height: 2)
                        }
                    }
                    Spacer()
                    Button {
                        withAnimation {
                            isUsed = "Snacks"
                            currentFoods = mainModule.Disheds.filter{$0.category == "Snacks"}
                        }
                    } label: {
                        VStack {
                            Text("Snacks")
                                .foregroundColor(isUsed == "Snacks" ?  Color("MyOrange") : .gray)
                            Rectangle()
                                .foregroundColor(isUsed == "Snacks" ?  Color("MyOrange") : Color.clear)
                                .frame(width: 60, height: 2)
                        }
                    }
                    Spacer()
                    Button {
                        withAnimation {
                            isUsed = "Sauce"
                            currentFoods = mainModule.Disheds.filter{$0.category == "Sauce"}
                        }
                    } label: {
                        VStack {
                            Text("Sauce")
                                .foregroundColor(isUsed == "Sauce" ?  Color("MyOrange") : .gray)
                            Rectangle()
                                .foregroundColor(isUsed == "Sauce" ?  Color("MyOrange") : Color.clear)
                                .frame(width: 60, height: 2)
                        }
                    }
                    Spacer()

                }
            }
            GoogleAds()
                .frame(width: GADAdSizeMediumRectangle.size.width, height: GADAdSizeMediumRectangle.size.height)
            VStack {
                ScrollView(.vertical) {
                    if(currentDish == nil) {
                        LazyVGrid(columns: columns, spacing: 70) {
                            if search == "" {
                                
                                ForEach(currentFoods, id: \.dishId) { dish in
                                    VStack {
                                        Spacer()
                                        Text("\(dish.nameDish)")
                                            .multilineTextAlignment(.center)
                                            .padding(.top,30)
                                        Spacer()
                                        Text("N\(dish.price)")
                                            .foregroundColor(Color("MyOrange"))
                                            .padding(.bottom, 20)
                                    }
                                    .frame(width: 156, height: 210)
                                    .background(
                                        KFImage(URL(string: "http://food.madskill.ru/up/images/\(dish.icon ?? "")"))
                                            .resizable()
                                            .cornerRadius(60)
                                            .frame(width: 128, height: 128)
                                            .offset(y: -50)
                                            
                                            
                                        ,alignment: .top
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.white)
                                        
                                    )
                                    .onTapGesture(perform: {
                                        withAnimation(.spring()) {
                                            currentDish = dish
                                            IsUsedAddCart = false
                                            number = 0
                                        }
                                    })
                                }
                            } else {
                                ForEach(dishes, id: \.dishId) { dish in
                                    VStack {
                                        Spacer()
                                        Text("\(dish.nameDish)")
                                            .multilineTextAlignment(.center)
                                            .padding(.top,30)
                                        Spacer()
                                        Text("N\(dish.price)")
                                            .foregroundColor(Color("MyOrange"))
                                            .padding(.bottom, 20)
                                    }
                                   
                                   
                                    .frame(width: 156, height: 210)
                                    .background(
                                        KFImage(URL(string: "http://food.madskill.ru/up/images/\(dish.icon ?? "")"))
                                            .resizable()
                                            .cornerRadius(60)
                                            .frame(width: 128, height: 128)
                                            .offset(y: -50)
                                            
                                            
                                        ,alignment: .top
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.white)
                                        
                                    )
                                    .onTapGesture(perform: {
                                        withAnimation(.spring()) {
                                            currentDish = dish
                                            IsUsedAddCart = false
                                            number = 0
                                        }
                                    })
                                }
                            }
                        }
                        .padding(.top,50)
                        .padding(.bottom,40)
                        
                    } else {
                        VStack {
                            HStack {
                                Button {
                                    withAnimation(.spring()) {
                                        currentDish = nil
                                    }
                                } label: {
                                    Text("<")
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                Button {
                                  screen = "OneitemScreen"
                                } label: {
                                    Text("More")
                                        .foregroundColor(.black)
                                }


                            }
                            .padding(.horizontal,20)
                            .padding(.top,15)
                            HStack {
                                KFImage(URL(string: "http://food.madskill.ru/up/images/\(currentDish?.icon ?? "")"))
                                    .resizable()
                                    .frame(width: 128, height: 128)
                                    .cornerRadius(60)
                                VStack {
                                    Text("\(currentDish?.nameDish ?? "")")
                                        .multilineTextAlignment(.center)
                                        .lineLimit(3)
                                        .padding(.bottom,15)
                                        .frame(width: .infinity, height: .infinity)
                                    Text("N\(currentDish?.price ?? "")")
                                        .foregroundColor(Color("MyOrange"))
                                }
                            }
                            
                           
                            if (!IsUsedAddCart) {
                                HStack {
                                    HStack {
                                        Button {
                                            
                                            
                                            if (number <= 0) {
                                                number = 0
                                            } else {
                                                number = number - 1
                                            }
                                        } label: {
                                            Text("-")
                                                .foregroundColor(.black)
                                                .frame(width: 28, height: 28)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 5)
                                                        .foregroundColor(Color("Silver"))
                                                )
                                        }
                                        Text("\(number)")
                                        Button {
                                            number = number + 1
                                        } label: {
                                            Text("+")
                                                .foregroundColor(.black)
                                                .frame(width: 28, height: 28)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 5)
                                                        .foregroundColor(Color("Silver"))
                                                )
                                        }
                                    }
                                    Button {
                                        withAnimation(.spring()) {
                                            if (number == 0 ) {
                                                alertMessage = "Невозможно добавить в корзину" 
                                                alert = true
                                                return
                                                
                                            }
                                            IsUsedAddCart = true
                                            do {
                                                currentDish!.count = number
                                                cart.append(currentDish!)
                                                
                                                let data = try JSONEncoder().encode(cart)
                                                
                                                UserDefaults.standard.set(data, forKey: "cart")
                                                
                                            }
                                            catch {
                                                print("123")
                                            }
                                            
                                        }
                                        
                                    } label: {
                                        HStack {
                                            Text("Add to cart")
                                                .foregroundColor(.white)
                                            Image("cart")
                                                .foregroundColor(.black)
                                        }
                                        .frame(width: 200, height: 40)
                                        .background(
                                         Capsule()
                                            .foregroundColor(Color("MyOrange"))
                                        )
                                    }


                                }
                                .padding(.top,50)
                            }
                            if (IsUsedAddCart) {
                                Button {
                                    
                                } label: {
                                    Text("Continue Shop")
                                        .frame(width: 300, height: 40)
                                        .foregroundColor(.white)
                                        .background(
                                            Capsule()
                                                .foregroundColor(Color("MyOrange"))
                                        )
                                }
                                Button {
                                    
                                } label: {
                                    Text("Go to cart")
                                        .frame(width: 300, height: 40)
                                        .foregroundColor(.white)
                                        .background(
                                            Capsule()
                                                .foregroundColor(Color("MyOrange"))
                                        )
                                }

                            }
                            Spacer()
                        }
                        .frame(width: 330)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white)
                        )
                    }
                }
                
             
            }
            Spacer()
        }
        .background(
            Color("Silver")
        )
        .onAppear(perform: {
            mainModule.getVersion {
                mainModule.getDishes {
                    currentFoods = mainModule.Disheds.filter{$0.category == "Foods"}
                }
            }
            
            do {
                let cartJson = UserDefaults.standard.data(forKey: "cart")
                let cartDecon = try JSONDecoder().decode([Dishes].self, from: cartJson ?? Data())
                self.cart = cartDecon
                print(cart)
               
            }
            catch {
                print("error")
            }
            
            
            
        })
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
        .alert(isPresented: $alert) {
            Alert(title: Text(alertMessage))
        }
    }
}

struct Cart : Codable {
    let dishId: String
    let count : Int
    
}

