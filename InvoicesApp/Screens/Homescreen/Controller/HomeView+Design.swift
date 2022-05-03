//
//  HomeView+Design.swift
//  InvoicesApp
//
//  Created by Gabriel Ivan on 30.04.2022.
//

import UIKit

extension HomeViewController: BaseInterface {
    
    func setupNavBar() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
    }
    
    func setupConstraints() {
        
    }
    
    func setupStylingViews() {
        
    }
    
    func setupButtonsMethods() {
        
    }
    
    func setupStrings() {
        
    }
}
