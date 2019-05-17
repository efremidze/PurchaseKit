//
//  PurchaseKit.swift
//  PurchaseKit
//
//  Created by Lasha Efremidze on 5/16/19.
//  Copyright © 2019 Lasha Efremidze. All rights reserved.
//

import SwiftyStoreKit
import StoreKit

public struct PurchaseKit {
    public enum Product: CaseIterable {
        case mathPack
        
        var identifier: String {
            switch self {
            case .mathPack:
                return "com.company.appname.MathPack"
            }
        }
    }
    
    public static let shared = PurchaseKit()
    
    public func getInfo(products: [Product], completion: @escaping ([SKProduct]?) -> Void) {
        let ids = products.map { $0.identifier }
        SwiftyStoreKit.retrieveProductsInfo(Set(ids)) { result in
            for product in result.retrievedProducts {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
            }
            for id in result.invalidProductIDs {
                print("Invalid product identifier: \(id)")
            }
            if let error = result.error {
                print("Error: \(error)")
            }
            completion(Array(result.retrievedProducts))
        }
    }
    
    public func purchase(product: Product, completion: () -> Void) {
        SwiftyStoreKit.purchaseProduct(product.identifier) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
            case .error(let error):
                switch error.code {
                case .unknown: print("Unknown error. Please contact support")
                case .clientInvalid: print("Not allowed to make the payment")
                case .paymentCancelled: break
                case .paymentInvalid: print("The purchase identifier was invalid")
                case .paymentNotAllowed: print("The device is not allowed to make the payment")
                case .storeProductNotAvailable: print("The product is not available in the current storefront")
                case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
                case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
                case .cloudServiceRevoked: print("User has revoked permission to use this cloud service")
                default: print("Unknown error. Please contact support")
                }
            }
        }
    }
    
    public func restorePurchases(completion: () -> Void) {
        SwiftyStoreKit.restorePurchases { results in
            if results.restoreFailedPurchases.count > 0 {
                print("Restore Failed: \(results.restoreFailedPurchases)")
            }
            else if results.restoredPurchases.count > 0 {
                print("Restore Success: \(results.restoredPurchases)")
            }
            else {
                print("Nothing to Restore")
            }
        }
    }
}
