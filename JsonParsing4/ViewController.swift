//
//  ViewController.swift
//  JsonParsing4
//
//  Created by Anirudh Bandi on 1/10/18.
//  Copyright © 2018 Anirudh Bandi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    struct WebsiteDescription: Decodable{
        let name : String
        let description : String
        let courses : [Course]
    }
    
    struct Course: Decodable{
        let id : Int?
        let name : String?
        let link : String?
        let imageUrl : String?
        
//        init(json: [String:Any]){
//            id = json["id"] as? Int ?? -1
//            name = json["name"] as? String ?? ""
//            link = json["link"] as? String ?? ""
//            imageUrl = json["imageUrl"] as? String ?? ""
//        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let jsonString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        
        guard let url = URL(string: jsonString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data  = data else { return }
            do {
                
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//
//                  print(websiteDescription.name)
//                print(websiteDescription.description)
                let courses = try JSONDecoder().decode([Course].self, from: data)
//
//                //Swift 2&3
//               guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
//                let course = Course(json: json)
                print(courses)
                print(courses[1].name)
                
                
                
            } catch let err {
                print(err)
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

