import UIKit

class InfoTableSectionFooter: UITableViewHeaderFooterView {
    
    @IBOutlet weak var orderPaid: UILabel!
    @IBOutlet weak var orderToPay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.backgroundButtonColor
    }
/*
    func set(order toPay: String, paid: String) {
    }
 */
}
