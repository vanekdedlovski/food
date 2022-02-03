//
//  ContentView.swift
//  WSRfood
//
//  Created by bnkwsr2 on 31.01.2022.
//

import SwiftUI
import SwiftLocation

struct ContentView: View {
    @State var screen = "firstScreen1"
    @StateObject var networdCheck = NetwordCheck()
    @StateObject var mainModule = MainModule()
    @State var currentDish : Dishes?
    @State var currentFoods : [Dishes] = []
    @State var isUsed = "Foods"
    @State var isUsed1 = "home"
    @State var cart : [Dishes] = []
    @State var street = ""
    
    var body: some View {
        if (screen == "firstScreen1") {
            fisrtScreen1(screen: $screen)
                .environmentObject(networdCheck)
                .environmentObject(mainModule)
            
                .onAppear(perform: {
                    DispatchQueue.main.async {
                        SwiftLocation.requestAuthorization(.onlyInUse) { newGps in
                            print(newGps)
                        }
                        
                        SwiftLocation.gpsLocation(accuracy: .room).then { result in
                            debugPrint(result)
                            debugPrint(result.location)
                            debugPrint(result.location?.coordinate)
                            var service = Geocoder.Apple(coordinates: .init(latitude: (result.location?.coordinate.latitude)!, longitude: (result.location?.coordinate.longitude)!))
                            SwiftLocation.geocodeWith(service).then { geoResult in
                                debugPrint(geoResult.data?.first?.clPlacemark?.name)
                                street =  geoResult.data?.first?.clPlacemark?.name ?? ""
                            }
                            
                        }
                    }
                })
        }
        else if (screen == "LoginLn") {
            LoginLn(screen: $screen)
                .environmentObject(networdCheck)
                .environmentObject(mainModule)
        } else if (screen == "RegisterLn") {
            RegisterLn(screen: $screen)
                .environmentObject(networdCheck)
                .environmentObject(mainModule)
        }
        else if (screen == "MainScreen") {
            MainScreen(screen: $screen, isUsed: $isUsed, isUsed1: $isUsed1, currentDish: $currentDish, cart: $cart, street: $street)
                .environmentObject(networdCheck)
                .environmentObject(mainModule)
        }
        else if (screen == "OneitemScreen") {
            OneItemScreen(screen: $screen, currentDish: $currentDish)
                .environmentObject(networdCheck)
                .environmentObject(mainModule)
        }
        else if (screen == "OrderPlaceHolder") {
            OrderPlaceHolder(screen: $screen, currentDish: $currentDish, isUsed: $isUsed, isUsed1: $isUsed1, cart: $cart)
                .environmentObject(networdCheck)
                .environmentObject(mainModule)
        }
        else if (screen == "HistoryScreen") {
            HistoryScreen(screen: $screen, currentDish: $currentDish, isUsed: $isUsed, isUsed1: $isUsed1, cart: $cart)
                .environmentObject(networdCheck)
                .environmentObject(mainModule)
        }
        
    }
}

//OrderPlaceHolder
