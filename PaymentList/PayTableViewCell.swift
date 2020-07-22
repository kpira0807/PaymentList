import UIKit

class PayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var payNumber: UILabel!
    @IBOutlet weak var payMoney: UILabel!
    @IBOutlet weak var payData: UILabel!
    @IBOutlet weak var payDataLabel: UILabel!
    @IBOutlet weak var payButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        payButton.layer.backgroundColor = UIColor.greenButtonColor.cgColor
        payButton.setTitleColor(UIColor.white, for: .normal)
        payButton.layer.cornerRadius = 15
        payButton.clipsToBounds = true
        
        payNumber.textColor = UIColor.grayColorText
        payDataLabel.textColor = UIColor.grayColorText
    }
}
