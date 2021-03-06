//
//  MainModule.swift
//  WSRfood
//
//  Created by bnkwsr2 on 31.01.2022.
//

import Foundation
import Alamofire
import SwiftUI
import EmailValidator

class MainModule : ObservableObject {
    @Published var email =  "vasya@mail.com"
    @Published var password = "qwerty"
    @Published var firstName = "John"
    @Published var phone = "123"
    @Published var error1 = ""
    @Published var token = ""
    @Published var success1 = false
    @Published  var RegisterOk = ""
    @Published var versions:[String] = []
    @Published var Disheds:[Dishes] = []
    
    func Loginln(success : @escaping () -> Void, error: @escaping () -> Void) {
        
        let result = EmailValidator.validate(email: email, allowTopLevelDomains: false, allowInternational: false)
        if (!result) {
            error1 = "email error"
            error()
            return
        }
        if (email == "" || password == "" ) {
            error1 = "Заполните все поля"
            error()
            return
        }
        
        
        let LoginStruct = Login(email: email, password: password)
        token = ""
        error1 = ""
        
        AF.request("https://food.madskill.ru/auth/login", method: .post, parameters: LoginStruct, encoder: JSONParameterEncoder.default)
            .responseDecodable(of: TokenType.self) { res in
                debugPrint(res)
                if (res.value?.token != nil) {
                    debugPrint(res.value?.token)
                    self.token = String(res.value!.token)
                    success()
                    
                    
                } else {
                    error()
                }
            }
            .responseString { res in
                self.error1 = res.value ?? ""
                error()
            }
            
        
    }
    func RegisterLn(success : @escaping () -> Void, error: @escaping () -> Void) {
        if (email == "" || password == "" || firstName == "" || phone == "") {
            error1 = "Заполните все поля"
            error()
            return
        }
        let RegisterStruct = Register(email: email, password: password, login: firstName)
        AF.request("https://food.madskill.ru/auth/register", method: .post, parameters: RegisterStruct)
            .responseDecodable(of: TokenType.self) { res in
                debugPrint(res)
                success()
            }
            .responseString { res in
                debugPrint(res)
                self.error1 = res.value ?? ""
                error()
                
            }
            
    }
    func getVersion(success : @escaping () -> Void) {
        AF.request("https://food.madskill.ru/dishes/version", method: .get)
            .responseDecodable(of: Versions.self) { res in
                self.versions = res.value?.version ?? []
                success()
            }
    }
    func getDishes(success : @escaping () -> Void) {
        versions.forEach { vers in
            AF.request("https://food.madskill.ru/dishes?version=\(vers)", method: .get)
                .responseDecodable(of: [Dishes].self) { res in
                    debugPrint(res)
                    self.Disheds += res.value ?? []
                    success()
                   
                }
        }
    }
}
struct Login : Codable {
    let email : String
    let password : String
}
struct Register : Codable {
    let email : String
    let password : String
    let login : String
}
struct TokenType : Codable {
    let token : Int
}
struct Versions : Codable {
    let version : [String]
}
struct Dishes : Codable, Hashable {
    let dishId : String
    let category : String
    let nameDish : String
    let price : String
    let icon : String
    let version : String
    var count : Int? = 0
    
}
