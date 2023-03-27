//
//  ViewController.swift
//  ContactsList
//
//  Created by giovanni russo on 27/03/23.
//

import UIKit

class ViewController: UIViewController {

    var aContact: Contact?

    @IBOutlet weak var myContactLabel: UILabel!
    
    @IBOutlet weak var myDescription: UILabel!
    
    required init?(coder: NSCoder, aContact: Contact?) {
        self.aContact = aContact
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myContactLabel.text = (aContact?.name ?? "Name") + " " + (aContact?.surname ?? "Surname")
        
        myDescription.text = aContact?.description

    }

}

