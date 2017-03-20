//
//  CalculatorViewController.swift
//  discountCalculator
//
//  Created by Joshua Marvel on 3/1/17.
//  Copyright © 2017 Joshua Marvel. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    let calculation = calcData.shared 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make swip gestures
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Swipe Function
    func handleSwipe(_ sender:UISwipeGestureRecognizer)
    {
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    //Enable unwinding other views
    @IBAction func unwindToCalc(segue:UIStoryboardSegue){}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Outlets
    
    @IBOutlet weak var priceTextbox: UITextField!
    
    @IBOutlet weak var dollarsOffTextbox: UITextField!
    
    @IBOutlet weak var discountTextbox: UITextField!
    
    @IBOutlet weak var otherDiscountTextbox: UITextField!
    
    @IBOutlet weak var taxTextbox: UITextField!
    
    @IBOutlet weak var orginalPriceLabel: UILabel!
    
    @IBOutlet weak var discountPriceLabel: UILabel!
    
    
    
    func Calculate()
    {
        var total = Float(0)
        taxTextbox.text = "7.75"
        let price: Float = Float(priceTextbox.text!)!
        let tax: Float = Float(taxTextbox.text!)!
        total = price * tax
        orginalPriceLabel.text = String(total)
        
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myDiscountCalc.price = Float(priceTextField.text!)!
    }
    
    func grabValue(){
    
    }
    
    
    
    
    

}
