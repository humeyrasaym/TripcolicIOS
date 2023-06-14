//
//  IGFeedPostActionsTableViewCell.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 5/27/23.
//

import UIKit

protocol IGFeedPostActionsTableViewCellDelegate: AnyObject {
    func didTapLikeButton()
    
    func didTapCommentButton()

    func didTapSendButton()

}

class IGFeedPostActionsTableViewCell: UITableViewCell {
    
    weak var delegate: IGFeedPostActionsTableViewCellDelegate?

    static let identifier = "IGFeedPostActionsTableViewCell"
    
    private let likeButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)
        let image = UIImage(systemName: "heart", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)
        let image = UIImage(systemName: "message", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)
        let image = UIImage(systemName: "paperplane" , withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(sendButton)
        
        
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(didTapCommentButton), for: .touchUpInside)
        sendButton.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapLikeButton(){
        delegate?.didTapLikeButton()
        
    }
    
    @objc private func didTapCommentButton(){
        delegate?.didTapCommentButton()
    }
    
    @objc private func didTapSendButton(){
        delegate?.didTapSendButton()
        
    }
    
    public func configure(with post: UserPost){
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //like,comment,send
        let buttonSize = contentView.height-10
        
        //let buttons = [likeButton, commentButton, sendButton]
        //for x in 0..<buttons.count {
            //let button = buttons[x] }
        likeButton.frame = CGRect(x: 5, y: 5, width: buttonSize, height: buttonSize)
        commentButton.frame = CGRect(x: likeButton.width + 5, y: 5, width: buttonSize, height: buttonSize)
        sendButton.frame = CGRect(x: likeButton.width + buttonSize + 5, y: 5, width: buttonSize, height: buttonSize)

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }


}
