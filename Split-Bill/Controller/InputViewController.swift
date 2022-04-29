//
//  ViewController.swift
//  Split-Bill
//
//  Created by Bahadır Kılınç on 28.04.2022.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var priceLabel: UITextField!
    @IBOutlet weak var zeroTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var twentyTipButton: UIButton!
    var tipAmount: Int?
    var price: Float?
    var personNumber: Int?
    var bill: Bill?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipSelected(_ sender: UIButton) {
        deActivateButtons()
        sender.isSelected = true
        if let amount = sender.currentTitle{
            tipAmount = Int(amount.dropLast())
        }
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let input = priceLabel.text{
            price = Float(input)
        }
        if let fPrice = price, let fPersonNumber = personNumber, let fTipAmount = tipAmount{
            bill = Bill(price: fPrice, personNumber: fPersonNumber, tipAmount: fTipAmount)
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    @IBAction func stepperChanged(_ sender: UIStepper) {
        stepperLabel.text = String(format: "%.0f", sender.value)
        personNumber = Int(sender.value)
    }
    func deActivateButtons(){
        zeroTipButton.isSelected = false
        twentyTipButton.isSelected = false
        tenTipButton.isSelected = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let secondVC = segue.destination as! ResultViewController
            secondVC.bill = self.bill
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

