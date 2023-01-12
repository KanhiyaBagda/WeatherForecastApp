//
//  ViewController.swift
//  WeatherDemoApp
//
//  Created by mac on 11/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var weatherUI = WeatherView()
    var service = HttpService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fetch Weatherdata FromServer
        service.getWeatherData()
        
        self.loadCustomView()
        
    }
    
    func loadCustomView(){
        
        weatherUI.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(weatherUI)
        
        //Manage SafeArea
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            weatherUI.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: weatherUI.bottomAnchor, multiplier: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            weatherUI.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            weatherUI.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}

