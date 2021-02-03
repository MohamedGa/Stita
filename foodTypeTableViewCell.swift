//
//  foodTypeTableViewCell.swift
//  Stita
//
//  Created by Mohammed Gamal on 8/19/20.
//  Copyright © 2020 codelabs. All rights reserved.
//

import UIKit

class foodTypeTableViewCell: UITableViewCell {
    @IBOutlet weak var foofImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foofDescription: UILabel!
    @IBOutlet weak var caloryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
