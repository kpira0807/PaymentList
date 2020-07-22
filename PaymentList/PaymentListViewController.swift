import UIKit
import Foundation

class PaymentListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var modelData = Models.shared.dataModel()
    
    // сколько ячеек в одной (выплат)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if modelData[section].opened == true {
            
            print(modelData[section].payment.count)
            return modelData[section].payment.count + 1
            
        } else {
            return 1
        }
    }
    
    // for a more understandable kind of number
    func separatedNumber(_ number: Any) -> String {
        guard let itIsANumber = number as? NSNumber else { return "Not a number" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        return formatter.string(from: itIsANumber)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexData = indexPath.row - 1
        
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MainTableViewCell else {return UITableViewCell()}
            
            let dateModel = modelData[indexPath.section]
            
            cell.orderNumber?.text = dateModel.numberOrder
            
            let date = Date()
            let format = DateFormatter()
            format.dateFormat = "dd.MM.yy"
            let formattedDate = format.string(from: date)
            cell.orderDate.text = "Состояние на \(formattedDate)"
            
            cell.orderPay.text = separatedNumber(dateModel.orderPay ?? 0) + " p."
            
            var sum = 0
            let pay = modelData[indexPath.section].payment

            let filter = pay.filter{$0.isPaid == true}
            let arr = filter.map{$0.money}
            
            for value in arr  as NSArray as! [Int]{
                sum = sum + value
            }
            
            cell.orderSumma.text = separatedNumber(sum) + " p."
            
            let debt = dateModel.orderPay! - sum
            cell.orderSpend.text = separatedNumber(debt) + " p."
            
            // for index open or close cell
            if modelData[indexPath.row].opened == true {
                cell.statusImage.image = #imageLiteral(resourceName: "arw_red_bottom")
            } else {
                cell.statusImage.image = #imageLiteral(resourceName: "arw_red_top")
            }
            return cell
            
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellPay") as? PayTableViewCell  else {return UITableViewCell()}
            let dateModel = modelData[indexPath.section].payment[indexData]
            
            cell.payNumber?.text = dateModel.name
            cell.payMoney?.text = separatedNumber(dateModel.money ?? 0) + " p."
            cell.payData?.text = dateModel.date
            
            if dateModel.isPaid == true {
                cell.payButton.layer.backgroundColor = UIColor.greenButtonColor.cgColor
                cell.payButton.setTitleColor(UIColor.white, for: .normal)
                cell.payButton.setTitle("Оплачено", for: .normal)
                cell.payMoney.textColor = UIColor.greenButtonColor
                cell.payData.textColor = UIColor.greenButtonColor
                
            } else {
                cell.payButton.layer.backgroundColor = UIColor.grayColorButton.cgColor
                cell.payButton.setTitleColor(UIColor.white, for: .normal)
                cell.payButton.setTitle("Ожидание", for: .normal)
                cell.payMoney.textColor = UIColor.black
                cell.payData.textColor = UIColor.black
            }
            
            cell.isUserInteractionEnabled = false
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if modelData[indexPath.section].opened == true {
                modelData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                modelData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelData.count
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "\(InfoTableSectionFooter.self)", bundle: nil)
        self.tableView.register(nib, forHeaderFooterViewReuseIdentifier: "InfoTableSectionFooter")
        
        // delete "Back" work near button back
        self.navigationController!.navigationBar.topItem!.title = ""
        
        view.layer.backgroundColor = UIColor.grayColor.cgColor
        
        tableView.layer.cornerRadius = 10
        tableView.clipsToBounds = true
    }
    
    // for last cell
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let  footerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InfoTableSectionFooter") as! InfoTableSectionFooter
        
        var sum = 0
        let dateModel = modelData[section]
        let pay = modelData[section].payment
        let filter = pay.filter{$0.isPaid == true}
        let arr = filter.map{$0.money}
        
        for value in arr  as NSArray as! [Int]{
            sum = sum + value
        }
        
        footerCell.orderPaid.text = separatedNumber(sum) + " p."
        
        let debt = dateModel.orderPay! - sum
        footerCell.orderToPay.text = separatedNumber(debt) + " p."

        footerCell.isUserInteractionEnabled = false
        return footerCell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 73.0
    }
}

