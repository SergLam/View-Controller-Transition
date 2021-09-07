import UIKit

final class CoolViewController: UIViewController, CustomPresentable {
    
    var transitionManager: UIViewControllerTransitioningDelegate?

    let rectangleView: UIView = .make(backgroundColor: UIColor.systemPink.withAlphaComponent(0.5), cornerRadius: 12.0)

    let sizeButton: UIButton = .make(
        contentColor: .white,
        backgroundColor: .systemPink,
        title: "Change rectangle size!",
        textFormat: (17.0, .bold),
        height: 50,
        cornerRadius: 25,
        padding: 16
    )

    let dismissButton: UIButton = .make(
        contentColor: .systemPink,
        backgroundColor: .clear,
        title: "Dismiss",
        textFormat: (17.0, .bold),
        height: 50,
        cornerRadius: 25,
        padding: 16,
        style: .outline
    )

    var rectangleHeightConstraint: NSLayoutConstraint!

    // MARK: - Life cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initialSetup()
    }

    // MARK: - Private functions
    private func initialSetup() {
        
        setupLayout()
        
        sizeButton.addTarget(self, action: #selector(sizeButtonTapped), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20.0
        
        view.addSubview(rectangleView)

        rectangleView.translatesAutoresizingMaskIntoConstraints = false
        
        rectangleHeightConstraint = rectangleView.heightAnchor.constraint(equalToConstant: 100.0)
        let rectangleViewConstraints: [NSLayoutConstraint] = [
        
            rectangleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16),
            rectangleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            rectangleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            rectangleHeightConstraint
        ]
        NSLayoutConstraint.activate(rectangleViewConstraints)

        view.addSubview(sizeButton)
        sizeButton.translatesAutoresizingMaskIntoConstraints = false
        let sizeButtonConstraints: [NSLayoutConstraint] = [
            sizeButton.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 16),
            sizeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(sizeButtonConstraints)
        
        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        let dismissButtonConstraints: [NSLayoutConstraint] = [
            dismissButton.topAnchor.constraint(equalTo: sizeButton.bottomAnchor, constant: 16),
            dismissButton.widthAnchor.constraint(equalTo: sizeButton.widthAnchor),
            dismissButton.centerXAnchor.constraint(equalTo: sizeButton.centerXAnchor),
            dismissButton.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(dismissButtonConstraints)
        
    }
    
    // MARK: - Actions
    @objc
    private func dismissButtonTapped() {
        dismiss(animated: true)
    }

    @objc
    private func sizeButtonTapped() {
        rectangleHeightConstraint.constant = CGFloat(Int.random(in: 50...400))
        updatePresentationLayout(animated: true)
    }
    
}
