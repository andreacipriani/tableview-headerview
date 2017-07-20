import UIKit

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!

    override func viewDidLoad() {
        view.backgroundColor = .blue
        super.viewDidLoad()
        setupTableView()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        let headerNib = UINib(nibName: "CustomTableViewHeader", bundle: nil)
        let headerView = headerNib.instantiate(withOwner: self, options: nil).first!
        tableView.tableHeaderView = (headerView as! UIView)
    }
}

extension ViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.label.text = "\(indexPath.row)"
        return cell
    }
}
