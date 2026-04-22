//
//  ViewController.swift
//  Group6Project
//
//  Created by Boston, Samuel T. on 4/16/26.
//

import UIKit

    class ModelViewController: UIViewController {
        
        var carType: String? = nil
        var selectedCar: String?
        var selectedPrice: String?
        var selectedIndex: IndexPath?
        
        var cars: [String] = []
        var prices: [String] = []
        var images: [UIImage] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        @IBAction func cancelBtn(_ sender: Any) {
            dismiss(animated: true)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            var carImgStrings: [String] = []
            switch (carType)
            {
            case "BMW":
                cars = ["X1 SUV", "X2 Coupe SUV", "X3 SUV", "X5 SUV"]
                prices = ["$40,000 - 50,000", "$40,000 - 50,000", "$50,000 - 60,000", "$60,000 - 70,000"]
                carImgStrings = ["x1", "x2", "x3", "x5"]
                break;
            case "Ford":
                cars = ["2026 Explorer", "2026 Escape", "2026 Bronco", "2026 Ranger"]
                prices = ["$30,000 - 40,000", "$30,000 - 40,000", "$40,000 - 50,000", "$30,000 - 40,000"]
                carImgStrings = ["explorer", "escape", "bronco", "ranger"]
                break;
            case "Harley Davidson":
                cars = ["Street Bob", "Low Riders"]
                prices = ["$14,999", "$18,999"]
                carImgStrings = ["streetbob", "lowrider"]
                break;
            case "Volkswagen":
                cars = ["Atlas", "Atlas Cross Sport"]
                prices = ["$39,000 - 45,000", "$38,000", "$45,000"]
                carImgStrings = ["atlas", "atlascross"]
                break;
            default:
                break;
            }
            
            images = []
            for var carImg in carImgStrings
            {
                images.append(UIImage(named: carImg)!)
            }
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "showBuy",
                  let indexPath = sender as? IndexPath else { return }

            let destination = segue.destination as! BuyViewController
            destination.carName = cars[indexPath.section]
            destination.carPrice = prices[indexPath.section]
            destination.carImage = images[indexPath.section]
        }
    }

    extension ModelViewController: UITableViewDataSource, UITableViewDelegate {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return cars.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell", for: indexPath)
            cell.textLabel?.text = cars[indexPath.section]
            cell.detailTextLabel?.text = prices[indexPath.section]
            
            //cell.imageView?.image = images[indexPath.section]
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showBuy", sender: indexPath)
        }
    }
