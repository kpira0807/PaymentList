import Foundation

struct ModelData {
    var opened = Bool()
    var numberOrder: String?
    var orderPay: Int?
    var payment = [Pay]()
}

struct Pay {
    var name: String?
    var date: String?
    var money: Int?
    var isPaid: Bool?
}
