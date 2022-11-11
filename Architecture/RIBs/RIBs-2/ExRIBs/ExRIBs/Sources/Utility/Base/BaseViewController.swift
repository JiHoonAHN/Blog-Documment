import UIKit

internal class BaseViewController: UIViewController {
    
    let bounds = UIScreen().bounds
    
    // MARK: - Initalizer
    init() {
        super.init(nibName: nil, bundle: nil)
        configureUI()
        addView()
        bindView()
        bindAction()
        bindState()
    }
    // MARK: - Required
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        addView()
        bindView()
        bindAction()
        bindState()
    }
    
    // MARK: - Layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayout()
    }
    // MARK: - Override
    func configureUI() {}
    func addView() {}
    func setLayout() {}
    //MARK: - Bind
    func bindView(){}
    func bindAction(){}
    func bindState(){}
}
