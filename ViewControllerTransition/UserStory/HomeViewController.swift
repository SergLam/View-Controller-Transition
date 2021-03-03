import UIKit

final class HomeViewController: UIViewController {

    let presentButton: UIButton = .make(contentColor: .white,
                                        backgroundColor: .systemPink,
                                        title: "Present the thing!",
                                        textFormat: (17.0, .bold),
                                        height: 50.0,
                                        cornerRadius: 25.0,
                                        padding: 16.0)
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }

    private func initialSetup() {
        
        setupLayout()
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        
        view.backgroundColor = UIColor.white
        view.addSubview(presentButton)
        
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        let presentButtonConstraints: [NSLayoutConstraint] = [
            presentButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            presentButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ]
        NSLayoutConstraint.activate(presentButtonConstraints)
    }
    
    // MARK: - Actions
    @objc
    private func presentButtonTapped() {
        
        let coolViewController = CoolViewController()
        present(coolViewController, interactiveDismissalType: .standard)
    }
}
