//
//  BuyViewController.swift
//  Group6Project
//
//  Created by Boston, Samuel T. on 4/20/26.
//

import UIKit

class BuyViewController: UIViewController {

    var carName: String?
    var carPrice: String?
    var carImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = carName
        costLabel.text = carPrice
        descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ligula mi, bibendum vel libero eget, pellentesque fermentum lorem. Nam vitae ipsum sed nunc pulvinar elementum sed quis augue. Pellentesque finibus commodo mauris, eu tristique nunc mattis eu. Suspendisse finibus vitae lacus non egestas. Duis iaculis leo eu magna venenatis, a imperdiet dui lobortis. Nulla bibendum lacus in diam malesuada, ut feugiat nibh sollicitudin. Phasellus ultricies lorem sed quam luctus dictum. Morbi maximus viverra dui, id bibendum ligula finibus a. Pellentesque a nulla id leo luctus maximus id quis justo. Morbi maximus euismod enim, at dictum nisl congue a. Vivamus egestas quam sit amet lorem facilisis, ut cursus mi convallis. Aliquam et nisl a metus ultricies convallis sit amet eu lorem. Nam aliquet ex eget ultricies venenatis."
        
        imageView.image = carImage
    }
}
