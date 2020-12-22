//
//  FlashViewController.swift
//  TestFireBase
//
//  Created by Apple on 12/17/20.
//

import UIKit

class FlashViewController: UIViewController {

    var data: [Any] = []
    var data2: [Any] = []
    var data3: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetData.shared.getData { (success, repoen, error) in
            if success {
                DispatchQueue.main.async {
                    self.data = repoen as! [Any]
                    print("\(self.data)")
                    DispatchQueue.main.async {
                        self.perform(#selector(self.openTabHome), with: nil, afterDelay: 3)
                    }
                }
                
            }
        }
        
        GetData.shared.getData2 { (success, repoen, error) in
            if success {
                DispatchQueue.main.async {
                    self.data2 = repoen as! [Any]
                    print("\(self.data2)")
                    DispatchQueue.main.async {
                        self.perform(#selector(self.openTabHome), with: nil, afterDelay: 3)
                    }
                }
                
            }
        }
        
        GetData.shared.getData3 { (success, repoen, error) in
            if success {
                DispatchQueue.main.async {
                    self.data3 = repoen as! [Any]
                    print("\(self.data3)")
                    DispatchQueue.main.async {
                        self.perform(#selector(self.openTabHome), with: nil, afterDelay: 3)
                    }
                }
                
            }
        }
    }
    
    @objc func openTabHome(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "tabhome") as? TabHomeViewController
        vc?.modalPresentationStyle = .fullScreen
        vc?.data = data
        vc?.data2 = data2
        vc?.data3 = data3
        present(vc!, animated: true, completion: nil)
    }
    
}
