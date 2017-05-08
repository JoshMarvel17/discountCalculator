



import UIKit

extension CGContext{
    func setFillColor(_ hex:Int){
        //mask different vlaues of the hex code
        //0xFF0000 -Red
        //0x00FF00 - Green
        //0x0000FF - Blue
        
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor:CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue:blueColor, alpha:1.0)
    }
}

class GraphView: UIView {
    
    let data = calcData.shared
    override func draw(_ rect: CGRect){
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        let leftMargin:CGFloat = 16.0
        let rightMargin:CGFloat = screenWidth - 16.0
        
        let topMargin:CGFloat = 80.0
        
        let totalRecHeight = screenHeight - 180.0
        let midPoint = (screenWidth)/2
        
        //draw rectangle
        context.setFillColor(0x84516D)
        
        //context.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        
        
        //draw text
       
        let blackText = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size:16.0)!,
            NSForegroundColorAttributeName: UIColor(red:0.0, green:0.0, blue:0.0, alpha:1.0)
        ]
     

        context.setFillColor(0x2DCF09)
        context.fill(CGRect(x:leftMargin, y:topMargin, width:(screenWidth)/2 - 16, height:totalRecHeight))
        
       
        context.setFillColor(0x09ABCF)
        let savePercentHeight = (data.percentSaved/100)*Double(totalRecHeight)
        context.fill(CGRect(x: midPoint, y: 64.0 + leftMargin, width: midPoint - leftMargin, height: CGFloat(savePercentHeight)))
        
        
        let payPercentHeight = Double(totalRecHeight) - savePercentHeight
        
        
        context.setFillColor(0xCF2409)
        context.fill(CGRect(x: midPoint, y: CGFloat(savePercentHeight) + 80.0, width: midPoint - leftMargin, height: CGFloat(payPercentHeight)))
        
        
        
        let priceText = "OG Price"
        let priceTextCoord = CGPoint(x:leftMargin, y:totalRecHeight + leftMargin*6)
        priceText.draw(at: priceTextCoord, withAttributes: blackText)
        
        let priceAmount = "$\(String(format: "%.2f", data.priceWithTax))"
        let priceAmountCoord = CGPoint(x:leftMargin, y:totalRecHeight + leftMargin*7)
        priceAmount.draw(at: priceAmountCoord, withAttributes: blackText)
     
        let payText = "You Paid"
        let payTextCoord = CGPoint(x: rightMargin - 64, y: totalRecHeight + leftMargin*6)
        payText.draw(at: payTextCoord, withAttributes: blackText)
        
        let payAmount = "$\(String(format: "%.2f", data.priceWithTax - data.percentSaved))"
        let payAmountCoord = CGPoint(x: rightMargin - 64, y: totalRecHeight + leftMargin*7)
        payAmount.draw(at: payAmountCoord, withAttributes: blackText)
        
        let payPercent = "\(String(format: "%.2f", data.percentPaid))%"
        let payPercentCoord = CGPoint(x: rightMargin - 64, y: totalRecHeight + leftMargin*8)
        payPercent.draw(at: payPercentCoord, withAttributes: blackText)
        
        let saveText = "You Saved"
        let saveTextCoord = CGPoint(x: midPoint - 32, y: totalRecHeight + leftMargin*6)
        saveText.draw(at: saveTextCoord, withAttributes: blackText)
        
        let saveAmount = "$\(String(format: "%.2f", data.savings))"
        let saveAmountCoord = CGPoint(x: midPoint - 32 , y: totalRecHeight + leftMargin*7)
        saveAmount.draw(at: saveAmountCoord, withAttributes: blackText)
        
        let savePercent = "\(String(format: "%.2f", data.percentSaved))%"
        let savePercentCoord = CGPoint(x: midPoint - 32, y: totalRecHeight + leftMargin*8)
        savePercent.draw(at: savePercentCoord, withAttributes: blackText)
      
        
    }
    
}
