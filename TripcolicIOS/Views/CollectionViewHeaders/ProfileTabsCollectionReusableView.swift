//
//  ProfileTabsCollectionReusableView.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 6/1/23.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    

    
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        

    }
    
    

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

    }
}
