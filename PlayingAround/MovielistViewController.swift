//
//  MovielistViewController.swift
//  PlayingAround
//
//  Created by James O'Toole on 20/6/19.
//  Copyright © 2019 NoMoss. All rights reserved.
//

import UIKit

class MovielistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let name = ViewController.movies[indexPath.row]["Name"] as! String
        var releaseDate = ViewController.movies[indexPath.row]["ReleasedAt"] as! String
        releaseDate =  String(releaseDate.prefix(10))
        let moviedate = name + " " + releaseDate
        
        cell?.textLabel!.text=moviedate
        return cell!
    }

}
