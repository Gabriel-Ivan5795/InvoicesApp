//
//  Welcomescreen+UI.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 15.04.2022.
//

import UIKit
import InvoicesHelpers
import LoadingDialog

extension WelcomeScreenViewController {
    
    func setupBinders() {
        //self.welcomeViewUI.getInvoicesAppGridView().getCollectionView().bindTo(self.welcomeViewModel.welcomeData)
        self.welcomeViewModel.welcomeData.bind { [weak self] datas in
            if (datas.count > 0) {
                self?.welcomeViewUI.getInvoicesAppGridView().getCollectionView().reloadData()
            } else {
                print("No items to show")
            }
        }
        
        self.welcomeViewModel.error.bind { [weak self] error in
            if let error = error {
                self?.showAlert(_errorMessage: error)
            }
        }
        
        self.welcomeViewModel.isLoadingEnabled.bind { [weak self] isLoadingEnabled in
            if (isLoadingEnabled) {
                LoadingDialog.show(context: self!)
            } else {
                LoadingDialog.hide(context: self!)
            }
        }
    }
}

extension UICollectionView {
    
    func bindTo<T>(_ bindable: ObservableHelper<T>) {
        bindable.bind{ [weak self] _ in
            self?.reloadData()
        }
    }
}
