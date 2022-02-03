//
//  GoogleAds.swift
//  WSRfood
//
//  Created by bnkwsr2 on 01.02.2022.
//
import SwiftUI
import UIKit

import GoogleMobileAds

struct GoogleAds : UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) ->  UIViewController {
        let banner = GADBannerView(adSize: GADAdSizeMediumRectangle)
        let controller = UIViewController()
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        banner.rootViewController = controller
        controller.view.addSubview(banner)
        controller.view.frame = CGRect(origin: .zero, size: GADAdSizeMediumRectangle.size)
        banner.load(GADRequest())
        return controller
    }
}
