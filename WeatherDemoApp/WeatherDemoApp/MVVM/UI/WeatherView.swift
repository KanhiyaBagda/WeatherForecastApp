//
//  WeatherView.swift
//  WeatherDemoApp
//
//  Created by mac on 11/01/23.
//

import UIKit

class WeatherView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadCustomView()
    }
    
    
    
    func loadCustomView(){
        //backgroundColor = .red
        //Information of the city – country, city, current date and time
        
        
        let cityLbl = UILabel()
        cityLbl.layer.name = "City"
        cityLbl.font = UIFont.boldSystemFont(ofSize: 14)
        cityLbl.translatesAutoresizingMaskIntoConstraints = false
        cityLbl.text = "CityName :" + "Jaipur"
        cityLbl.textColor = .black //UIColor.init(red: 188 / 255, green: 143 / 255, blue: 143 / 255, alpha: 1.0)
        addSubview(cityLbl)
        
        NSLayoutConstraint.activate([
            cityLbl.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            cityLbl.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 10),
            cityLbl.topAnchor.constraint(equalTo: topAnchor,constant: 10)
        ])
        
        let DateNTime = UILabel()
        DateNTime.layer.name = "City"
        DateNTime.font = UIFont.boldSystemFont(ofSize: 14)
        DateNTime.translatesAutoresizingMaskIntoConstraints = false
        DateNTime.text = "Date :" + "Time :"
        DateNTime.textColor = .black //UIColor.init(red: 188 / 255, green: 143 / 255, blue: 143 / 255, alpha: 1.0)
        addSubview(DateNTime)
        
        
        let verticalSpace = NSLayoutConstraint(item: DateNTime, attribute: .bottom, relatedBy: .equal, toItem: cityLbl, attribute: .bottom, multiplier: 1, constant: 50)
        
        NSLayoutConstraint.activate([
            DateNTime.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            DateNTime.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 10),
            verticalSpace
        ])
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WeatherForecastCell.self, forCellWithReuseIdentifier: "WeatherForecastCell")
        collectionView.backgroundColor = .yellow
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        addSubview(collectionView)
        NSLayoutConstraint.activate([
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        //collectionView.topAnchor.constraint(lessThanOrEqualTo: topAnchor, constant: 700),
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        collectionView.heightAnchor.constraint(equalToConstant: 200)
            

        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell: WeatherForecastCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherForecastCell", for: indexPath) as! WeatherForecastCell
        
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 100)
        }
}
