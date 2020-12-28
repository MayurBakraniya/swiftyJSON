//
//  TableViewCell.swift
//  swiftyJSON
//
//  Created by MAC on 19/12/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var artistId: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackCensoredName: UILabel!
    @IBOutlet weak var albumImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
