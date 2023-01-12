//
//  WeatherView.swift
//  WeatherDemoApp
//
//  Created by mac on 11/01/23.
//

import UIKit

class WeatherView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadCustomView()
    }
    

    func loadCustomView(){
        //backgroundColor = .red
        //Information of the city – country, city, current date and time
        DispatchQueue.main.async {
            let cityLbl = UILabel()
            cityLbl.font = UIFont.boldSystemFont(ofSize: 14)
            cityLbl.translatesAutoresizingMaskIntoConstraints = false
            cityLbl.text = "CityName :" + "Jaipur, Rajasthan"
            cityLbl.textColor = .black //UIColor.init(red: 188 / 255, green: 143 / 255, blue: 143 / 255, alpha: 1.0)
            self.addSubview(cityLbl)
            
            
            NSLayoutConstraint.activate([
                cityLbl.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
                cityLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
            
            let DateNTime = UILabel()
            DateNTime.font = UIFont.boldSystemFont(ofSize: 14)
            DateNTime.translatesAutoresizingMaskIntoConstraints = false
            DateNTime.text = "DateTime :"
            DateNTime.textColor = .black //UIColor.init(red: 188 / 255, green: 143 / 255, blue: 143 / 255, alpha: 1.0)
            self.addSubview(DateNTime)
            
            
            let verticalSpace = NSLayoutConstraint(item: DateNTime, attribute: .bottom, relatedBy: .equal, toItem: cityLbl, attribute: .bottom, multiplier: 1, constant: 50)
            
            NSLayoutConstraint.activate([
                DateNTime.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
                DateNTime.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 10),
                verticalSpace
            ])
            
            // 7- day forecast – icon for current weather condition, minimum and maximum temperatures
            // in Celsius and the date for the particular day
            
            let layout = UICollectionViewFlowLayout()
            layout.invalidateLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(WeatherForecastCell.self, forCellWithReuseIdentifier: "WeatherForecastCell")
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            
            self.addSubview(collectionView)
            
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                collectionView.heightAnchor.constraint(equalToConstant: 100)
            ])
            
        }
    }
            
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherForecastCell", for: indexPath) as! WeatherForecastCell
        
        myCell.backgroundColor = UIColor.blue
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 100)
        }
    
}
