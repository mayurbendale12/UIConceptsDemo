import UIKit

class ProgrammaticallyConstraintsController: UIViewController {
    private let redView = UIView()
    private let blueView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraintsUsingAnchors()
        addConstraintsUsingNSLayoutConstraint()
        addConstraintsUsingVisualFormat()
    }

    func addConstraintsUsingAnchors() {
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)

        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            redView.widthAnchor.constraint(equalToConstant: 100),
            redView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    func addConstraintsUsingNSLayoutConstraint() {
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueView)

        let widthConstraint = NSLayoutConstraint(item: blueView,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 100)
        let heightConstraint = NSLayoutConstraint(item: blueView,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 100)
        let topConstraint = NSLayoutConstraint(item: blueView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: redView,
                                               attribute: .bottom,
                                               multiplier: 1,
                                               constant: 50)
        let leadingConstraint = NSLayoutConstraint(item: blueView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: view.safeAreaLayoutGuide,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 20)
        view.addConstraints([widthConstraint, heightConstraint, topConstraint, leadingConstraint])
    }

    func addConstraintsUsingVisualFormat() {
        let lable1 = UILabel()
        let lable2 = UILabel()
        let label3 = UILabel()

        view.addSubview(lable1)
        view.addSubview(lable2)
        view.addSubview(label3)

        lable1.translatesAutoresizingMaskIntoConstraints = false
        lable2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false

        lable1.text = "Hello World!"
        lable1.backgroundColor = .systemBrown
        lable2.text = "Hello World!"
        lable2.backgroundColor = .systemTeal
        label3.text = "Hello World!"
        label3.backgroundColor = .systemOrange

        let viewsDictionary: [String: Any] = ["blueView": blueView, "label1": lable1, "label2": lable2, "label3": label3]
        let metrics = ["labelHeight": 88]
        ["label1", "label2", "label3"].forEach { label in
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[\(label)]-|", metrics: nil, views: viewsDictionary))
        }

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[blueView]-[label1(labelHeight@999)]-[label2(labelHeight)]-[label3(labelHeight)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
    }
}
