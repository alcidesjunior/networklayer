//
//  ViewController.swift
//  studyNetworkLayer
//
//  Created by Alcides Junior on 05/01/20.
//  Copyright © 2020 Alcides Junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var networkManager =  NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ok")
        // Do any additional setup after loading the view.
        self.networkManager.getNewMovies(page: 1) { (movies, error) in
            if let error = error{
                print(error)
            }
            if let movies = movies{
                print(movies)
            }
        }
    }


}

