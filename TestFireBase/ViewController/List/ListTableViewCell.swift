//
//  ListTableViewCell.swift
//  TestFireBase
//
//  Created by Apple on 12/21/20.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameLocation: UILabel!
    @IBOutlet weak var addressLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.borderWidth = 2
        bgView.layer.borderColor = UIColor.lightGray.cgColor
        bgView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
