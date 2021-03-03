import UIKit

protocol CustomPresentable: UIViewController {
    
    var transitionManager: UIViewControllerTransitioningDelegate? { get set }
    
    var dismissalHandlingScrollView: UIScrollView? { get }
    
    func updatePresentationLayout(animated: Bool)
}

extension CustomPresentable {
    
    var dismissalHandlingScrollView: UIScrollView? { nil }

    func updatePresentationLayout(animated: Bool = false) {
        
        presentationController?.containerView?.setNeedsLayout()
        
        guard animated else {
            presentationController?.containerView?.layoutIfNeeded()
            return
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .allowUserInteraction, animations: {
            
            self.presentationController?.containerView?.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
}
