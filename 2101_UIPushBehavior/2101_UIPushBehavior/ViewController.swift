//
//  ViewController.swift
//  2101_UIPushBehavior
//
//  Created by Kristina Kostenko on 13.08.2024.
//

import UIKit

class ViewController: UIViewController {

    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var pushBehaviour = UIPushBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createGestureRecognizer()
        createSmallSquareView()
        createAnimationAndBehaviours()
        
    }

    //creating square
    
    func createSmallSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = UIColor.green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    //creating gesture
    func createGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handletap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //creating view's collision and pushing
    func createAnimationAndBehaviours() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        pushBehaviour = UIPushBehavior(items: [squareView], mode: .continuous)
        animator.addBehavior(collision)
        animator.addBehavior(pushBehaviour)
    }
    
    @objc func handletap(paramTap: UITapGestureRecognizer) {
        //getting angle of view
        let tapPoint: CGPoint = paramTap.location(in: view)
        let squareViewCenterPoint: CGPoint = squareView.center
        //arc tan 2((p1.x - p2.x), (p1.y - p2.y))
        let deltaX: CGFloat = tapPoint.x - squareViewCenterPoint.x
        let deltaY: CGFloat = tapPoint.y - squareViewCenterPoint.y
        let angle: CGFloat = atan2(deltaY, deltaX)
        pushBehaviour.angle = angle
        
        let distanceBetweenPoints: CGFloat = sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0) + pow(tapPoint.y - squareViewCenterPoint.y, 2.0))
        pushBehaviour.magnitude = distanceBetweenPoints / 200
        
    }
}


