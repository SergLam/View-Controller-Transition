import UIKit

final class ModalTransitionAnimator: NSObject {

    private let presenting: Bool

    init(presenting: Bool) {
        self.presenting = presenting
        super.init()
    }
}

extension ModalTransitionAnimator: UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if presenting {
            animatePresentation(using: transitionContext)
        } else {
            animateDismissal(using: transitionContext)
        }
    }

    private func animatePresentation(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let presentedViewController = transitionContext.viewController(forKey: .to) else {
            return
        }
        transitionContext.containerView.addSubview(presentedViewController.view)

        let presentedFrame = transitionContext.finalFrame(for: presentedViewController)
        let dismissedFrame = CGRect(x: presentedFrame.minX, y: transitionContext.containerView.bounds.height, width: presentedFrame.width, height: presentedFrame.height)

        presentedViewController.view.frame = dismissedFrame

        let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), dampingRatio: 1.0) {
            presentedViewController.view.frame = presentedFrame
        }

        animator.addCompletion { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

        animator.startAnimation()
    }

    private func animateDismissal(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let presentedViewController = transitionContext.viewController(forKey: .from) else {
            return
        }
        let presentedFrame = transitionContext.finalFrame(for: presentedViewController)
        let dismissedFrame = CGRect(x: presentedFrame.minX, y: transitionContext.containerView.bounds.height, width: presentedFrame.width, height: presentedFrame.height)

        let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), dampingRatio: 1.0) {
            presentedViewController.view.frame = dismissedFrame
        }

        animator.addCompletion { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

        animator.startAnimation()
    }
}
