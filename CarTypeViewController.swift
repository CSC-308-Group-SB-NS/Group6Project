//
//  CarTypeViewController.swift
//  Group6Project
//
//  Created by Boston, Samuel T. on 4/18/26.
//

import UIKit

class CarTypeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let carTypes = ["BMW", "SUV", "Truck", "Motorcycles"]
    let carCounts = [4, 3, 5, 1]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarTypeCell", for: indexPath)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        let titleLabel = UILabel()
        titleLabel.text = carTypes[indexPath.item]
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        
        let countLabel = UILabel()
        countLabel.text = "Amount: \(carCounts[indexPath.item])"
        countLabel.font = .systemFont(ofSize: 14)
        countLabel.textColor = .darkGray
        countLabel.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, countLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        cell.contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])
        
        cell.backgroundColor = .systemBlue.withAlphaComponent(0.1)
        cell.layer.cornerRadius = 12
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showModel", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showModel",
           let cell = sender as? UICollectionViewCell,
           let indexPath = collectionView.indexPath(for: cell) {
            
            let destination = segue.destination as! ModelViewController
            destination.carType = carTypes[indexPath.item]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 20
            layout.sectionInset = .zero
        }
    }
}

extension CarTypeViewController {
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16
        let spacing: CGFloat = 12
        
        let totalSpacing = spacing + padding * 2
        let width = (collectionView.frame.width - totalSpacing) / 2
        let height = width * 0.8
        
        return CGSize(width: width, height: height)
    }
}
