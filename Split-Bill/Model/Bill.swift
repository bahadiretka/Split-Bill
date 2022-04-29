//
//  Bill.swift
//  Split-Bill
//
//  Created by Bahadır Kılınç on 29.04.2022.
//

import Foundation


struct Bill {
    var price: Float
    var personNumber: Int
    var tipAmount: Int

    func calculatePerPerson() -> Float{
        let res = price + (price * Float(tipAmount) / 100)
        return res / Float(personNumber)
    }
}
