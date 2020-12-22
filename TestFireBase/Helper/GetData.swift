//
//  GetData.swift
//  TestFireBase
//
//  Created by Apple on 12/18/20.
//

import Foundation
import Firebase

class GetData {
    
    public static let shared = GetData()
    
    func getData(completion: @escaping (Bool, Any?, Error?) -> Void) {
        let database = Database.database().reference()
        do {
            database.child("Data1").observeSingleEvent(of: .value, with: { snapshot in
                if let dictionary = snapshot.value as? [String : Any] {
                    var data: [Any] = []
                    let air = dictionary["Air"] as! NSNumber
                    let humity = dictionary["Do am"] as! Float
                    let tem = dictionary["Nhiet do"] as! Float
                    let viDo = dictionary["Vi do"] as! NSNumber
                    let kinhDo = dictionary["Kinh do"] as! NSNumber
                    let name = dictionary["Ten vi tri"] as! String
                    let address = dictionary["Dia chi"] as! String
                    
                    data.append(air)
                    data.append(humity)
                    data.append(tem)
                    data.append(viDo)
                    data.append(kinhDo)
                    data.append(name)
                    data.append(address)
                    completion(true,data,nil)
                }
            })
        }
        catch {
            print("ko co data")
            completion(false,nil,error)
        }
    }
    
    func getData2(completion: @escaping (Bool, Any?, Error?) -> Void) {
        let database = Database.database().reference()
        do {
            database.child("Data2").observeSingleEvent(of: .value, with: { snapshot in
                if let dictionary = snapshot.value as? [String : Any] {
                    var data: [Any] = []
                    let air = dictionary["Air"] as! NSNumber
                    let humity = dictionary["Do am"] as! Float
                    let tem = dictionary["Nhiet do"] as! Float
                    let viDo = dictionary["Vi do"] as! NSNumber
                    let kinhDo = dictionary["Kinh do"] as! NSNumber
                    let name = dictionary["Ten vi tri"] as! String
                    let address = dictionary["Dia chi"] as! String
                    
                    data.append(air)
                    data.append(humity)
                    data.append(tem)
                    data.append(viDo)
                    data.append(kinhDo)
                    data.append(name)
                    data.append(address)
                    completion(true,data,nil)
                }
            })
        }
        catch {
            print("ko co data")
            completion(false,nil,error)
        }
    }
    
    func getData3(completion: @escaping (Bool, Any?, Error?) -> Void) {
        let database = Database.database().reference()
        do {
            database.child("Data3").observeSingleEvent(of: .value, with: { snapshot in
                if let dictionary = snapshot.value as? [String : Any] {
                    var data: [Any] = []
                    let air = dictionary["Air"] as! NSNumber
                    let humity = dictionary["Do am"] as! Float
                    let tem = dictionary["Nhiet do"] as! Float
                    let viDo = dictionary["Vi do"] as! NSNumber
                    let kinhDo = dictionary["Kinh do"] as! NSNumber
                    let name = dictionary["Ten vi tri"] as! String
                    let address = dictionary["Dia chi"] as! String
                    
                    data.append(air)
                    data.append(humity)
                    data.append(tem)
                    data.append(viDo)
                    data.append(kinhDo)
                    data.append(name)
                    data.append(address)
                    completion(true,data,nil)
                }
            })
        }
        catch {
            print("ko co data")
            completion(false,nil,error)
        }
    }
}
