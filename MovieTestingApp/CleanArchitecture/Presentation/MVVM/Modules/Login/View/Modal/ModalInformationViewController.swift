//
//  ModalInformationViewController.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import UIKit

// MARK: - ModalInformationDelegate
protocol ModalInformationDelegate: AnyObject {
    func didTapAccept()
}

class ModalInformationViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    
    // MARK: Properties
    weak var delegate: ModalInformationDelegate?
    var titleModal: String = .empty
    var descriptionModal: String = .empty
    var titleForAcceptButton: String = NSLocalizedString("accept", comment: "accept")
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupModal()
    }
    
    // MARK: - Functions
    private func setupModal() {
        self.titleLabel.text = self.titleModal
        self.subTitleLabel.text = self.descriptionModal
        self.acceptButton.setTitle(self.titleForAcceptButton, for: .normal)
    }
    
    // MARK: - IBActions
    @IBAction func didTapAccept(_ sender: UIButton) {
        self.delegate?.didTapAccept()
    }
}
