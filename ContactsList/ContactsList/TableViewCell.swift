//
//  TableViewCell.swift
//  ContactsList
//
//  Created by giovanni russo on 27/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with aContact: Contact) {
        
        myLabel.text = aContact.name + " " + aContact.surname
        
    }
}


