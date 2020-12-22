//
//  WeatherViewController.swift
//  TestFireBase
//
//  Created by Apple on 12/17/20.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        

    @IBOutlet weak var tableView: UITableView!
    
    
    var data: [Any] = []
    var data2: [Any] = []
    var data3: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = InfoViewController()
        vc.modalPresentationStyle = .fullScreen
        if indexPath.row == 0 {
            vc.tempPin = Double(data[2] as! Float)
            vc.humiPin = Double(data[1] as! Float)
            vc.quality = Double(data[0] as! NSNumber)
            vc.namePin = data[5] as! String
            vc.addressPin = data[6] as! String
        }
        if indexPath.row == 1 {
            vc.tempPin = Double(data2[2] as! Float)
            vc.humiPin = Double(data2[1] as! Float)
            vc.quality = Double(data2[0] as! NSNumber)
            vc.namePin = data2[5] as! String
            vc.addressPin = data2[6] as! String
        }
        if indexPath.row == 2 {
            vc.tempPin = Double(data3[2] as! Float)
            vc.humiPin = Double(data3[1] as! Float)
            vc.quality = Double(data3[0] as! NSNumber)
            vc.namePin = data3[5] as! String
            vc.addressPin = data3[6] as! String
        }
        vc.index = indexPath.row + 1
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        if indexPath.row == 0 {
            cell.nameLocation.text = (data[5] as! String)
            cell.addressLocation.text = data[6] as! String
        }
        if indexPath.row == 1 {
            cell.nameLocation.text = (data2[5] as! String)
            cell.addressLocation.text = data2[6] as! String
        }
        if indexPath.row == 2 {
            cell.nameLocation.text = (data3[5] as! String)
            cell.addressLocation.text = data3[6] as! String
        }

        return cell
    }

}
