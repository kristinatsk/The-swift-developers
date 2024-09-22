//
//  ViewController.swift
//  UIPushBehavior
//
//  Created by Kristina Kostenko on 13.08.2024.
//

import UIKit

class ViewController: UIViewController {

    //let squareView = UIView()
    var squareViews = [UIDynamicItem]()
    var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // only by code , storyboard not convenient
        // read or watch about
        //UICollisionBehaviour - обнаружения столкновений
        //UIGravityBehaviour - обеспечивает тяготение
        //UIPushBehaviour - реагирует на толчки
        //UISnapBehaviour - крепит view к определенной точке
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        /*
        //creating square
        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squareView.backgroundColor = UIColor.green
        squareView.center = view.center
        view.addSubview(squareView)
        
        //creating animator and gravity
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [squareView])
        animator.addBehavior(gravity)
         */
        
        //creating view
        let numberOfView = 2
        squareViews.reserveCapacity(numberOfView)
        let colors = [UIColor.red, UIColor.green]
        var currentCenterPoint: CGPoint = view.center
        let eachViewSize = CGSize(width: 50, height: 50)
        
        for counter in 0..<numberOfView {
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
            newView.backgroundColor = colors[counter]
            newView.center = currentCenterPoint
            currentCenterPoint.y += eachViewSize.height + 10
            view.addSubview(newView)
            squareViews.append(newView)
        }
        
        animator = UIDynamicAnimator(referenceView: view)
        
        //creating gravity
        let gravity = UIGravityBehavior(items: squareViews)
        animator.addBehavior(gravity)
        
        //collision
        let collision = UICollisionBehavior(items: squareViews)
        collision.translatesReferenceBoundsIntoBoundary = true //not go down than boud
        
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, 
                              from: CGPoint(x: 0, y: view.bounds.size.height - 100),
                              to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height - 100))
        
        collision.collisionDelegate = self
        animator.addBehavior(collision)
    }
    
}

extension ViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: any UIDynamicItem, withBoundaryIdentifier identifier: (any NSCopying)?, at p: CGPoint) {
        let identifier = identifier as? String
        let kbottomBoundary = "bottomBoundary"
        if identifier == kbottomBoundary {
            UIView.animate(withDuration: 1.0, animations: {
                let view = item as? UIView
                view?.backgroundColor = UIColor.red
                view?.alpha = 0.0
                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }, completion: { (finished) in
                let view = item as? UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
            })

        }
    }
    
}

