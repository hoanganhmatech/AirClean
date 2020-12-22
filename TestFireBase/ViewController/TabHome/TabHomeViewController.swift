//
//  TabHomeViewController.swift
//  TestFireBase
//
//  Created by Apple on 12/17/20.
//

import UIKit

class TabHomeViewController: UIViewController {

    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var viewTap: UIView!
    @IBOutlet weak var btnMap: UIButton!
    @IBOutlet weak var btnWeather: UIButton!
    @IBOutlet weak var lblMap: UILabel!
    @IBOutlet weak var lblWeather: UILabel!
    
    var listVC : [UIViewController] = []
    var numberChildInVC : Int = 0
    var data: [Any] = []
    var data2: [Any] = []
    var data3: [Any] = []
    
    override func viewDidLoad() {
        //print(quality!)
        super.viewDidLoad()
        setupView()
        addListViewController()
        loadViewTab(child: listVC[0])
    }
    
    func addListViewController() {
    
        let map = MapViewController()
        let wea = ListViewController()
        wea.data = data
        wea.data2 = data2
        wea.data3 = data3
        map.data = data
        map.data2 = data2
        map.data3 = data3
       
        listVC = [map, wea]
    }
    
    private func setupView() {
        viewTap.layer.borderWidth = 2
        viewTap.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func tapMap(_ sender: Any) {
        btnMap.setImage(UIImage(named: "Map"), for: .normal)
        btnWeather.setImage(UIImage(named: "unWeather"), for: .normal)
        
        if numberChildInVC != 0 {
            loadViewTab(child: listVC[0])
        }
        numberChildInVC = 0
    }
    
    @IBAction func tapWeather(_ sender: Any) {
        btnMap.setImage(UIImage(named: "unMap"), for: .normal)
        btnWeather.setImage(UIImage(named: "Weather"), for: .normal)
        
        if numberChildInVC != 1 {
            loadViewTab(child: listVC[1])
        }
        numberChildInVC = 1
    }
    
    func loadViewTab(child: UIViewController){
        listVC[numberChildInVC].willMove(toParent: nil)
        listVC[numberChildInVC].view.removeFromSuperview()
        listVC[numberChildInVC].removeFromParent()
       
        child.view.frame = childView.frame
        childView.addSubview(child.view)
        self.addChild(child)
        child.didMove(toParent: self)
    }
}
