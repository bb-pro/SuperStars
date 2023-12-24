//
//  CustomViewWithShadow.swift
//  Football136
//
//  Created by Bektemur Mamashayev on 24/12/2023. Bektemur on 21.12.2023.
//
import UIKit

final class CustomViewWithShadow: UIView {
    
    // MARK: - Override Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.addShadow()
        self.layer.cornerRadius = 4
    }
}
