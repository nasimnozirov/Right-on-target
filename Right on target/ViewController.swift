//
//  ViewController.swift
//  Right on target
//
//  Created by Nasim Nozirov on 11.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var number = 0
    var round = 0
    var point = 0
    
    
    private let numSlider = CustomSlider()
    private let startBotton = CustomButton(withTitle: "Проверить", textAlignment: .center, font: 30)
    private let minValueLabel = CustomLabel(title: "1", font: UIFont.systemFont(ofSize: 20))
    private let maxValueLabel = CustomLabel(title: "50", font: UIFont.systemFont(ofSize: 20))
    private let totalValueLabel = CustomLabel(title: "20", font: UIFont.systemFont(ofSize: 30))
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.backgroundColor = .yellow
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.backgroundColor = .yellow
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addTarget()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        view.addSubview(verticalStackView)
        view.addSubview(horizontalStackView)
        checkNumber()
        setConstraints()
        addElementInStackView()
        
    }
    
    private func addElementInStackView() {
        horizontalStackView.addArrangedSubview(minValueLabel)
        horizontalStackView.addArrangedSubview(numSlider)
        horizontalStackView.addArrangedSubview(maxValueLabel)
        verticalStackView.addArrangedSubview(totalValueLabel)
        verticalStackView.addArrangedSubview(startBotton)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  100),
            horizontalStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -780),
            horizontalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            
            verticalStackView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 80),
            verticalStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -700),
//            verticalStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: 200),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
//            verticalStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            minValueLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30),
            maxValueLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30)
        ])
    }
    
    private func addTarget() {
        startBotton.addTarget(self, action: #selector(comparisonValue), for: .touchUpInside)
        numSlider.addTarget(self, action: #selector(passingSliderValue), for: .valueChanged)
    }
    
    @objc func passingSliderValue() {
        
        
    }
    
    func checkNumber() {
        
        if round == 0 {
            number = Int.random(in: 1...50)
            print(number)
            totalValueLabel.text = String(number)
            round = 1
       
            
        }
        if round == 5 {
            showAlert()
        }
                
    }
     
    @objc  func comparisonValue() {
            
        let slider = Int(numSlider.value.rounded())
        
        if slider > number {
            point += 50 - slider + number
        } else if slider < number {
            point += 50 - number + slider
        } else {
            point += 50
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(
            title: "Игра окончена чипушилa",
            message: "Вы заработали\(point) о4ка",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
        present(alert, animated: true)
        round = 1
        point = 0
    }
    
}
