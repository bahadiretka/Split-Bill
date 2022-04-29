//
//  ResultViewController.swift
//  Split-Bill
//
//  Created by Bahadır Kılınç on 29.04.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultPriceLabel: UILabel!
    var bill: Bill?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let res = bill{
            resultLabel.text = "Split between \(res.personNumber)  people, with \(res.tipAmount)% tip"
            resultPriceLabel.text = String(format: "%.1f", res.calculatePerPerson())
        }else{
            resultLabel.text = "Opppps something went wrong :("
            resultPriceLabel.text = "0.0"
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
