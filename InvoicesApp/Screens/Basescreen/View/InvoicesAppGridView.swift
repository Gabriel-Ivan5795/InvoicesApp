//
//  InvoicesAppGridView.swift
//  InvoicesApp
//
//  Created by Ivan Gabriel on 14.04.2022.
//

import UIKit

class InvoicesAppGridView: UIView {

    private var collectionViewPager: UICollectionView!
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if (self.superview != nil) {
            
            self.setupViews()
            self.setupConstraints()
        }
    }
    
    func setupViews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        self.collectionViewPager = UICollectionView(frame: CGRect(x: 0,
                                                                  y: 0,
                                                                  width: UIScreen.main.bounds.width - 50,
                                                                  height: UIScreen.main.bounds.height - 310),
                                                    collectionViewLayout: layout)
        self.collectionViewPager.backgroundColor = .clear
        self.collectionViewPager.register(InvoicesAppCollectionViewCell.self,
                                          forCellWithReuseIdentifier: "InvoicesAppCollectionViewCell")
        self.collectionViewPager.isScrollEnabled = true
        self.collectionViewPager.isPagingEnabled = true
        self.collectionViewPager.showsVerticalScrollIndicator = false
        self.collectionViewPager.showsHorizontalScrollIndicator = false
        self.addSubview(self.collectionViewPager)
    }
    
    func setupConstraints() {
        self.collectionViewPager.anchor(top: self.topAnchor,
                                        left: self.leftAnchor,
                                        bottom: self.bottomAnchor,
                                        right: self.rightAnchor)
    }
    
    func setupBackgroundColor(_color: UIColor) {
        self.backgroundColor = _color
    }
    
    func setupCornerRadiu(_cornerRadius: CGFloat) {
        self.layer.cornerRadius = _cornerRadius
    }
    
    func setupShadow() {
        self.addShadow()
    }
    
    func registerCollectionViewCell(_type: InvoicesAppCollectionViewCell.Type,
                                    _reuseIdentifier: String) {
        self.collectionViewPager.register(_type,
                                          forCellWithReuseIdentifier: _reuseIdentifier)
    }
    
    func getCollectionView() -> UICollectionView {
        return self.collectionViewPager
    }
}
