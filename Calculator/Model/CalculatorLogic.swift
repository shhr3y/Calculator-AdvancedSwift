import Foundation

struct CalculatorBrain{
    private var number: Double?
    private var intermediateCalculation : (num1: Double, operation: String)?
    
    mutating func setNumber(_ number:Double){
        self.number = number
    }
    
    mutating func calculate(symbol:String) -> Double? {
        if let num = number {
            if(symbol == "+/-"){
                return num * -1
            }
            else if(symbol == "AC"){
                return 0
            }
            else if(symbol == "%"){
                return num / 100
            }
            else if(symbol == "="){
                return performTwoNumberCalculation(n2: num)
            }
            else{
                intermediateCalculation = (num1: num,operation: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.num1, let op = intermediateCalculation?.operation{
            if op == "+"{
                return n1+n2
            }
            if op == "-"{
                return n1-n2
            }
            if op == "÷"{
                return n1/n2
            }
            if op == "×"{
                return n1*n2
            }
        }
        return nil
    }
}
