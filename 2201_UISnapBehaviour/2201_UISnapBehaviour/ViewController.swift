//
//  ViewController.swift
//  2201_UISnapBehaviour
//
//  Created by Kristina Kostenko on 14.08.2024.
//

import UIKit

class ViewController: UIViewController {

    //UISnapBehavior
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var snapBehaviour: UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createGestureRecognizer()
        createSmallSquareView()
        createAnimationAndBehaviour()
    }

    func createGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(paramTap: )))
        view.addGestureRecognizer(tap)
    }
    
    func createSmallSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = UIColor.green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    func createAnimationAndBehaviour() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        snapBehaviour = UISnapBehavior(item: squareView, snapTo: squareView.center)
        snapBehaviour?.damping = 0.5
        animator.addBehavior(snapBehaviour!)
    }
    
    @objc func handleTap(paramTap: UITapGestureRecognizer) {
        //get angle between square's center view and point of tapping
        let tapPoint = paramTap.location(in: view)
        if snapBehaviour != nil {
            animator.removeBehavior(snapBehaviour!)
        }
        snapBehaviour = UISnapBehavior(item: squareView, snapTo: tapPoint)
        snapBehaviour?.damping = 0.5//average oscillation
        animator.addBehavior(snapBehaviour!)
    }

}

