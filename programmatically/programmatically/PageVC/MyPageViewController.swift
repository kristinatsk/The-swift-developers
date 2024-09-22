//
//  MyPageViewController.swift
//  programmatically
//
//  Created by Kristina Kostenko on 12.08.2024.
//

import UIKit

class MyPageViewController: UIPageViewController {

    //MARK: - Variable
    var cars = [CarsHelper]()
    let bmw = UIImage(named: "car1")
    let audi = UIImage(named: "car2")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Cars"
        let firstCar = CarsHelper(name: "Car - BMW", image: bmw!)
        let lastCar = CarsHelper(name: "Car - Audi", image: audi!)
        cars.append(firstCar)
        cars.append(lastCar)
    }
    
    //MARK: - Create vc
    
    lazy var arrayCarViewController: [CarViewController] = {
        var carsVC = [CarViewController]()
        
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
        
    }()
    //MARK: - init UIPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = UIColor.green
        self.dataSource = self
        self.delegate = self
        
        setViewControllers([arrayCarViewController[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MyPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else {return nil}
        if let index = arrayCarViewController.firstIndex(of: viewController) {
            if index > 0 {
                return arrayCarViewController[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else {return nil}
        if let index = arrayCarViewController.firstIndex(of: viewController) {
            if index < cars.count - 1 {
                return arrayCarViewController[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
