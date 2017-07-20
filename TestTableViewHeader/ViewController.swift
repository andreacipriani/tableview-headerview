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
        let headerView = headerNib.instantiate(withOwner: self, options: nil).first! as! UIView
        headerView.frame = CGRect(origin: headerView.frame.origin, size: CGSize(width: headerView.frame.width, height: 400))
        tableView.tableHeaderView = headerView
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.label.text = "\(indexPath.row)"
        return cell
    }
}
