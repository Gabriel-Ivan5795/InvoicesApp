//
//  FirebaseConfig.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 11.04.2022.
//

import UIKit
import Firebase
import FirebaseCrashlytics

class FirebaseConfig: NSObject {

    class func initializeProject() {
        FirebaseApp.configure()
    }
    
    class func initializeCrashlytics() {
        Crashlytics.initialize()
    }
    
    class func getDatabaseInstance() -> Firestore {
        let db = Firestore.firestore()
        return db
    }
    
    class func processTestCrash() {
        let arrayForTest = NSMutableArray()
        #if DEBUG
            print(arrayForTest.object(at: 2))
        #endif
    }
}
