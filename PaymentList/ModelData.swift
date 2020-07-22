import Foundation
import UIKit

class Models {
    static let shared = Models()
    
    var modelData = [
        ModelData(opened: false, numberOrder: "Заказ №44", orderPay: 1000000, payment:
            [Pay(name: "Оплата №1", date: "21.03.2019", money: 100000, isPaid: true),
             Pay(name: "Оплата №2", date: "28.03.2019", money: 150000, isPaid: true),
             Pay(name: "Оплата №3", date: "30.05.2019", money: 250000, isPaid: false)]),
        ModelData(opened: false, numberOrder: "Заказ №45", orderPay: 5000000, payment:
            [Pay(name: "Оплата №1", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №2", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №3", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №4", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №5", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №6", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №7", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №8", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №9", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №10", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №11", date: "17.06.2020", money: 50000, isPaid: true),
             Pay(name: "Оплата №12", date: "13.07.2020", money: 150000, isPaid: false)]),
        ModelData(opened: false, numberOrder: "Заказ №46", orderPay: 20000, payment:
            [Pay(name: "Оплата №1", date: "21.09.2020", money: 5000, isPaid: true),
             Pay(name: "Оплата №2", date: "28.10.2020", money: 5000, isPaid: false),
             Pay(name: "Оплата №3", date: "30.11.2020", money: 10000, isPaid: false)])]
    
    
    func dataModel() -> [ModelData] {
        return modelData
    }
}
