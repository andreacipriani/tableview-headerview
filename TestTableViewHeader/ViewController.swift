import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet fileprivate weak var tableView: UITableView!

    // MARK: - Private properties

    fileprivate let customCellIdentifier = "CustomCell"
    private let tableViewHeaderInitialFrame = CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 200))
    private let tableViewHeaderUpdatedFrame = CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 500))
    fileprivate let headerView: CustomTableViewHeader = UINib(nibName: "CustomTableViewHeader", bundle: nil).instantiate(withOwner: self, options: nil).first! as! CustomTableViewHeader

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTableViewHeaderView()
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        simulateLongOperation() {
            DispatchQueue.main.sync {
                self.headerView.activityIndicator.isHidden = true
                self.headerView.label.text = "I'm the updated HeaderView"
                self.updateTableViewHeaderFrame() //updateTableViewHeaderWithIOS9BugFix()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Private func

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: customCellIdentifier, bundle: nil), forCellReuseIdentifier: customCellIdentifier)
    }

    private func setupTableViewHeaderView() {
        headerView.frame = tableViewHeaderInitialFrame
        tableView.tableHeaderView = headerView
    }

    private func simulateLongOperation(completion: @escaping(() -> Void)){
        headerView.activityIndicator.startAnimating()
        DispatchQueue.global(qos: .background).async {
            sleep(3)
            completion()
        }
    }

    // Use this function to see the bug on iOS 9
    private func updateTableViewHeaderFrame() {
        tableView.tableHeaderView!.frame = tableViewHeaderUpdatedFrame
    }

    // Use this function to fix the bug
    private func updateTableViewHeaderWithIOS9BugFix() {
        headerView.frame = tableViewHeaderUpdatedFrame
        tableView.tableHeaderView = headerView
    }
}

extension ViewController: UITableViewDataSource {

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as! CustomCell
        cell.label.text = "Cell \(indexPath.row)"
        return cell
    }
}
