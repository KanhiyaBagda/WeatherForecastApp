//
//  WeatherForecastCell.swift
//  WeatherDemoApp
//
//  Created by mac on 11/01/23.
//

import UIKit

class WeatherForecastCell: UICollectionViewCell {
    @IBOutlet weak var dayLbl: UILabel?
    @IBOutlet weak var maxbl: UILabel?
    @IBOutlet weak var minLbl: UILabel?

    @IBOutlet weak var iconImg: UIImageView?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
