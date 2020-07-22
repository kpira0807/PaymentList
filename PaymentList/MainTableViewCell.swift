import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var orderPay: UILabel!
    @IBOutlet weak var orderSumma: UILabel!
    @IBOutlet weak var orderSpend: UILabel!
    @IBOutlet weak var orderSpendLabel: UILabel!
    @IBOutlet weak var orderDoneLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        orderNumber.textColor = UIColor.grayColorText
        orderDate.textColor = UIColor.grayColorText
        orderSumma.textColor = UIColor.grayColorText
        orderSpend.textColor = UIColor.grayColorText
        orderSpendLabel.textColor = UIColor.grayColorText
        orderDoneLabel.textColor = UIColor.grayColorText
    }
}
