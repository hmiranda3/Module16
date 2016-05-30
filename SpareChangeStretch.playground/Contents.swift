//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func change(amount: Double) -> String {
    let amountInCents = Int(amount * 100)
        let dollar = amountInCents / 100
        let quarters = (amountInCents - dollar*100) / 25
        let dimes = (amountInCents - dollar*100 - quarters*25) / 10
        let nickels = (amountInCents - dollar*100 - quarters*25 - dimes*10) / 5
        let pennies = amountInCents % 5
    
        return "Your change is \(dollar) dollars, \(quarters) quarters, \(dimes) dimes, \(nickels) nickels, and \(pennies) pennies."
    
}

print(change(2.79))
