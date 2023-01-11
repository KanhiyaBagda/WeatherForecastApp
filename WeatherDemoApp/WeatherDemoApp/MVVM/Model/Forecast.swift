//
//  Forecast.swift
//  WeatherDemoApp
//
//  Created by mac on 11/01/23.
//

import Foundation
struct Forecast : Codable {
    let forecastday : [Forecastday]?

    enum CodingKeys: String, CodingKey {

        case forecastday = "forecastday"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        forecastday = try values.decodeIfPresent([Forecastday].self, forKey: .forecastday)
    }

}