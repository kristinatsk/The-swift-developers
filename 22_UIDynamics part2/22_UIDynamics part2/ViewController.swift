//
//  ViewController.swift
//  22_UIDynamics part2
//
//  Created by Kristina Kostenko on 14.08.2024.
//

import UIKit

class ViewController: UIViewController {

    //UIAttachmentBehaviour
    //UISnapBehaviour
    
    var squareView = UIView()
    var squareViewAnchorView = UIView()//якорь для привязки
    var anchorView = UIView()
    var animator = UIDynamicAnimator()
    var attachmentBehaviour: UIAttachmentBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createSmallSquareView()
        createAnchorView()
        createGestureRecognizer()
        createAnimationAndBehaviours()
    }
    
    //create square and another one inside
    func createSmallSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = UIColor.green
        squareView.center = view.center
        squareViewAnchorView = UIView(frame: CGRect(x: 60, y: 0, width: 20, height: 20))
        squareViewAnchorView.backgroundColor = UIColor.brown
        squareView.addSubview(squareViewAnchorView)
        view.addSubview(squareView)
    }
    
    //view with point's attachment
    func createAnchorView() {
        anchorView = UIView(frame: CGRect(x: 120, y: 120, width: 20, height: 20))
        anchorView.backgroundColor = UIColor.red
        view.addSubview(anchorView)
    }
    
    //create recorder of gesture's panoraming
    func createGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(paramPan: )))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    //create collision and attachment
    func createAnimationAndBehaviours() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        attachmentBehaviour = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(collision)
        animator.addBehavior(attachmentBehaviour!)
    }
    
    //determine where is finger , red square thereto and then attachment to big square
    @objc func handlePan(paramPan: UIPanGestureRecognizer) {
        let tapPoint = paramPan.location(in: view)
        print(tapPoint)
        attachmentBehaviour?.anchorPoint = tapPoint
        anchorView.center = tapPoint
    }

}

