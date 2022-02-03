//
//  NetwordCheck.swift
//  WSRfood
//
//  Created by bnkwsr2 on 31.01.2022.
//

import Foundation
import Network

class NetwordCheck : ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "ntw")
    @Published var IsConnected = true
    init () {
        monitor.pathUpdateHandler = {
            path in
            DispatchQueue.main.async {
                self.IsConnected = path.status == .satisfied
            }
            
        }
        monitor.start(queue: queue)
    }
    
}
