import UIKit

class ViewController: UIViewController {
    @IBAction private func didTapAutolayoutButton(_ sender: Any) {
        performSegue(withIdentifier: "AutoLayout", sender: nil)
    }

    @IBAction private func didTapSizeClassesButton(_ sender: Any) {
        performSegue(withIdentifier: "SizeClass", sender: nil)
    }

    @IBAction private func didTapProgrammaticallyConstraintsButton(_ sender: Any) {
        performSegue(withIdentifier: "ProgrammaticallyConstraints", sender: nil)
    }
}
