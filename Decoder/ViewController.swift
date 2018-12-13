//
//  ViewController.swift
//  Decoder
//
//  Created by Wilmer sinchi on 10/30/18.
//  Copyright © 2018 Wilmer sinchi. All rights reserved.
//

import UIKit

//first you create a model object of anyhing you want when your parsing out json of your app
// set the property to string, int, depending on what type of property it is

struct Stocks  {
    let symbol : String?
    let askPrice : Double?
    let lastSalePrice : Double?
    let marketPercent : Double?
    
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let applestock = Stocks.init(symbol: <#T##String?#>, askPrice: <#T##Double?#>, lastSalePrice: <#T##Double?#>, marketPercent: <#T##Double?#>)
        nongeneric()
        // Do any additional setup after loading the view, typically from a nib.

}


func nongeneric(){
    
    let jsonUrlString = "https://ws-api.iextrading.com/1.0/tops?symbols=AAPL"
    
     let url = URL(string: jsonUrlString)
//    {return}
    
    URLSession.shared.dataTask(with: url!) { (data, _, err) in
        
        guard let data = data else {return}
        //            _ = String(data: data, encoding: .utf8)
        
        do {
            //                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as?[String:Any] else { return}
            //
            let stocks = try JSONDecoder().decode([Stocks].self, from: data)
            //                    JSONDecoder().decode([Stocks.self], from: data)
            print(stocks)
            
        } catch let jsonErr{
            print("Error serializing json:", jsonErr)
            
        }
        
        }.resume()
}

}


//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
//        // get the jsonurlstring of the a
//
//        let jsonUrlString = "https://ws-api.iextrading.com/1.0/tops?symbols=AAPL"
//        //you need the urlsession to fecth the data of that url/string, the URL need to be construsted so you need to covert that
//        guard let url = URL(string: jsonUrlString) else
//        {return}
//        // you can fix the error by force unwrapping it (url!)
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//            //code, perharpr check your error
//            // alsos perhsap check response status 200 ok
//            // where the data object is access
//            //        print("Do stuff here") // this was a test to see if the code passed through
//            //print the data as a stirng
//            guard let data = data else {return}
//                        let dataAsString = String(data: data, encoding: .utf8)

//            //            print(dataAsString!)
//            //
//
//            // how to use in swift 2 & 3 , to see how it was before
//            // this show the list like this on the command section
//            //            (
//            //                {
//            //                    askPrice = 215;
//            //                    askSize = 161;
//            //                    bidPrice = "213.14";
//            //                    bidSize = 100;
//            //                    lastSalePrice = "213.08";
//            //                    lastSaleSize = 100;
//            //                    lastSaleTime = 1540913112016;
//            //                    lastUpdated = 1540913116002;
//            //                    marketPercent = "0.0324";
//            //                    sector = technologyhardwareequipment;
//            //                    securityType = commonstock;
//            //                    symbol = AAPL;
//            //                    volume = 483985;
//            //                }
//            //            )
//            // this is the swift 2 or 3 version of parsing json data,, fix this later on
//            do {
//                //comment out for siwft 2 o 3 objc
//                //                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
//                ////                print(json)
//                //                // you get an error that you need to cast the json string to any otheriwse it wouldnt work
//                //                let stocks = Stocks(json: json)
//                //                print(stocks.askPrice)
//
//                let stocks = try JSONDecoder().decode(Stocks.self, from: data)
//                print(stocks.askPrice)
//            } catch let jsonErr{
//                print("Error serializing json:", jsonErr)
//
//            }
//
//            }.resume()
//    }
//
//
//}

