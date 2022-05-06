//
//  HomeView+Interactions.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 06.05.2022.
//

import UIKit

extension HomeViewController {
    
    @objc func btnLogout_onClick() {
        self.homeViewModel.firebaseLogout()
    }
}
