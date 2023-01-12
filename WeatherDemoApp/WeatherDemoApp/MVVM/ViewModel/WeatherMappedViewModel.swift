//
//  WeatherMappedViewModel.swift
//  WeatherDemoApp
//
//  Created by mac on 11/01/23.
//

import UIKit
protocol WeatherData : AnyObject{
    func updateTopView()
    func updateBottomView()
}

class WeatherMappedViewModel: NSObject{
    
    private var weatherUI = WeatherView()
    var weatherModel : WeatherDataModel?
    weak var delegate: WeatherData?
    
  

    func loadDataFromModel(){
        print(weatherModel)
        let location = weatherModel?.location
        if location != nil {
            weatherUI.loadCustomView()
        }
    }

}
