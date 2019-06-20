//
//  ViewController.swift
//  PlayingAround
//
//  Created by James O'Toole on 20/6/19.
//  Copyright © 2019 NoMoss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    static var movies : [NSDictionary]!
    static var movienames : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ViewController.movies = []
        getSomeData()
    }
    
    func getSomeData(){
        do {
            if let file = URL(string: "https://www.eventcinemas.com.au/Movies/GetNowShowing") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                let toplevel = json  as! [String: Any]
                
                
                let jsondata = toplevel["Data"]  as! [String: Any]
                let moviedata = jsondata["Movies"]  as! [Any]
                for movie  in moviedata{
                    let moviedictionary = movie as! NSDictionary
                    ViewController.movies.append(moviedictionary)
                }
                
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    @IBAction func hitButton(_ sender: Any) {
        button.setTitle("Welcome " + nameField.text!, for: .normal)
        let test = nameField.text! == "james" ? "yes":"no"
        if(test == "yes"){
            print("YOU ARE JAMES")
        }else{
            print("NOT JAMES")
        }
        
    }
    
}

