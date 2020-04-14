//
//  ViewController.swift
//  JSONSerial
//
//  Created by Shreyansh Raj on 09/04/20.
//  Copyright © 2020 Shreyansh Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var countryArray = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Start")
        getJSON()
    }

    func getJSON() {
        
        guard let url = URL(string: "http://countryapi.gear.host/v1/Country/getCountries") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                    
                    //print(json as Any)
                    print("Working")
                    
                    if let results = json!["Response"] as? [[String:Any]] {
                        
                        for result in results {

                            //print(r["Name"] as! String)
                            
                            self.countryArray.append(Country(
                                Name: result["Name"] as! String,
                                Alpha2Code: result["Alpha2Code"] as! String,
                                Alpha3Code: result["Alpha3Code"] as! String,
                                NativeName: result["NativeName"] as! String,
                                Region: result["Region"] as! String,
                                SubRegion: result["SubRegion"] as! String,
                                NativeLanguage: result["NativeLanguage"] as! String,
                                FlagPng: result["FlagPng"] as! String) )
                            
                            

                        }
                        
                        for item in self.countryArray {
                            
                            print(item.Name)
                            print(item.Alpha2Code)
                            print(item.Alpha2Code)
                            print(item.Alpha3Code)
                            print(item.NativeLanguage)
                            print(item.NativeName)
                            print(item.Region)
                            print(item.SubRegion)
                            print("-----------------------------")
                        }
                    }
                
                } catch {
                    print("JSON Error")
                }
            }
            
            
        }.resume()
        
    }

}

