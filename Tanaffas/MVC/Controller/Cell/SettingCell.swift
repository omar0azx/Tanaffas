//
//  SettingCell.swift
//  Tanaffas
//
//  Created by omar alzhrani on 08/08/1445 AH.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var settingTypeLabel: UILabel!
    
    @IBOutlet weak var settingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configar(type: String, image: UIImage) {
        settingTypeLabel.text = type
        settingImage.image = image
    }

}
