import UIKit
import Foundation

class MainViewController: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goButton.layer.backgroundColor = UIColor.backgroundButtonColor.cgColor
        goButton.layer.cornerRadius = 10
        goButton.clipsToBounds = true

        view.layer.backgroundColor = UIColor.grayColor.cgColor
    }
}
