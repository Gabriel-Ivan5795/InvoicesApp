//
//  Welcomescreen+Delegates.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 12.04.2022.
//

import UIKit

extension WelcomeScreenViewController: UIGestureRecognizerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.welcomeViewModel.welcomeData.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WelcomePageItemCell", for: indexPath) as? WelcomePageItemCell
        if (cell?.imageViewPage == nil) {
            cell?.awakeFromNib()
        }
        let welcomeModel = self.welcomeViewModel.welcomeData.value[indexPath.row]
        cell = cell?.setupCustomItemCell(_welcomeModel: welcomeModel)
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.frame.size.width
        let collectionViewHeight = collectionView.frame.size.height
        let cellWidth = Float(collectionViewWidth)
        let size = CGSize(width: CGFloat(cellWidth), height: CGFloat(collectionViewHeight))
        return size
    }
}
