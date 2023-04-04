//
//  TableViewCell.swift
//  TableViewTest
//
//  Created by koala panda on 2023/04/04.
//

import UIKit
class TableViewCell: UITableViewCell {
    
    @IBOutlet var iconView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mainTextLabel: UILabel!
    @IBOutlet var contentsImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
        nameLabel.text = nil
        mainTextLabel.text = nil
        contentsImageView.image = nil
    }
    func configure(user: UserModel) {
        if let iconImageUrlStr = user.icon {
            //
        }
        nameLabel.text = user.name
        mainTextLabel.text = user.mainText

        if let contentsImageURLStr = user.image {
            //
        } else {
            contentsImageView.isHidden = true
        }
    }

    static func cellHight(user _: UserModel) -> CGFloat {
        return 1000
    }

}
