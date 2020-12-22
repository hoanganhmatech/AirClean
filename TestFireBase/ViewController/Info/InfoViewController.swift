//
//  InfoViewController.swift
//  TestFireBase
//
//  Created by Apple on 12/17/20.
//

import UIKit
import Firebase

class InfoViewController: UIViewController {

    
    @IBOutlet weak var nameLocation: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var qualityAir: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var humi: UILabel!
    
    var namePin = ""
    var addressPin = ""
    var quality = 0.000
    var tempPin = 0.0
    var humiPin = 0.0
    var index = 0
    
    let database = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFireBase()
        nameLocation.text = namePin
        address.text = addressPin
        qualityAir.text = "\(quality) μg/m3"
        temp.text = "\(tempPin)"
        humi.text = "\(humiPin)"
    }
    
    
    func getDataFireBase() {
        database.child("Data\(index)").observeSingleEvent(of: .value, with: { snapshot in
            if let dictionary = snapshot.value as? [String : Any] {
                let air = dictionary["Air"] as! NSNumber
                let humity = dictionary["Do am"] as! Float
                let tem = dictionary["Nhiet do"] as! Float
                
                self.tempPin = Double(tem)
                self.humiPin = Double(humity)
                self.quality = Double(truncating: air)
                
                //self.nameLocation = ...
                //self.addressLocation = ...
            }
        })
    }

    override func viewDidAppear(_ animated: Bool) {
        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @IBAction func clickBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func update() {
        getDataFireBase()
        
        qualityAir.text = "\(quality) μg/m3"
        temp.text = "\(tempPin)"
        humi.text = "\(humiPin)"
    }
}
