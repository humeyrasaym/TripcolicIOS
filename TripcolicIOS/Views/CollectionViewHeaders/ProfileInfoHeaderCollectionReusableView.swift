//
//  ProfileInfoHeaderCollectionReusableView.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 6/1/23.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject{
    
    func profileHeaderdidTapPostsButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderdidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderdidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderdidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)

    
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let postsButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let followersButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let followingButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let editProfileButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Humeyra Sayim"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        
        let label = UILabel()
        label.text = "kunfeyekun"
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
        
    }
    
    private func addSubviews(){
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followersButton)
        addSubview(followingButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
    }
    
    private func addButtonActions(){
        followersButton.addTarget(self, action: #selector(didTapFollowersButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        postsButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        let buttonHeight = profilePhotoSize/2
        let countButtonWidht = (width-10-profilePhotoSize)/3
        
        profilePhotoImageView.frame = CGRect(x: 5,
                                             y: 5,
                                             width: profilePhotoSize,
                                             height: profilePhotoSize).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        
        postsButton.frame = CGRect(x: profilePhotoImageView.right,
                                   y: 5,
                                   width: countButtonWidht,
                                   height: buttonHeight).integral
        
        followersButton.frame = CGRect(x: postsButton.right,
                                       y: 5,
                                       width: countButtonWidht,
                                       height: buttonHeight).integral
        
        followingButton.frame = CGRect(x: followersButton.right,
                                       y: 5,
                                       width: countButtonWidht,
                                       height: buttonHeight).integral
        
        editProfileButton.frame = CGRect(x: postsButton.right,
                                         y: 5 + buttonHeight,
                                         width: countButtonWidht + 3,
                                         height: buttonHeight).integral
        
        nameLabel.frame = CGRect(x: 5,
                                 y: 5 + profilePhotoImageView.bottom,
                                 width: width - 10,
                                 height: 50 ).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        
        bioLabel.frame = CGRect(x: 5,
                                y: 5 + nameLabel.bottom,
                                width: width - 10,
                                height: bioLabelSize.height ).integral
        
    
    }
    
    //MARK: -Actions
    
    @objc private func didTapFollowersButton(){
        delegate?.profileHeaderdidTapFollowersButton(self)
        
        
    }
    
    @objc private func didTapFollowingButton(){
        delegate?.profileHeaderdidTapFollowingButton(self)
        
        
    }
    
    @objc private func didTapPostsButton(){
        delegate?.profileHeaderdidTapPostsButton(self)

        
        
    }
    
    @objc private func didTapEditProfileButton(){
        delegate?.profileHeaderdidTapEditProfileButton(self)

        
    }
    
}
