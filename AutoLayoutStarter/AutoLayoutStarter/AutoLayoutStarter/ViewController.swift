//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
   setupPurpleView()
    setupBlueSquares()
    setupredView()
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}
extension ViewController {
    func setupPurpleView() {
        let v=UIView()
        v.backgroundColor = .purple
        
        mainView.addSubview(v)
        v.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true
        v.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16).isActive = true
        v.heightAnchor.constraint(equalToConstant: 80).isActive = true
        v.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.70).isActive = true
    }


func setupBlueSquares(){
    let sq1 = UIView()
    sq1.backgroundColor = .blue
    sq1.translatesAutoresizingMaskIntoConstraints = false
    sq1.widthAnchor.constraint(equalToConstant: 80).isActive = true
    sq1.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
    let sq2 = UIView()
    sq2.backgroundColor = .blue
    sq2.translatesAutoresizingMaskIntoConstraints = false
    sq2.widthAnchor.constraint(equalToConstant: 80).isActive = true
    sq2.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
let sq3 = UIView()
sq3.backgroundColor = .blue
sq3.translatesAutoresizingMaskIntoConstraints = false
sq3.widthAnchor.constraint(equalToConstant: 80).isActive = true
sq3.heightAnchor.constraint(equalToConstant: 80).isActive = true

    let sv = UIStackView(arrangedSubviews: [UIView(),sq1,sq2,sq3,UIView()])
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis = .vertical
    sv.distribution = .equalSpacing

    mainView.addSubview(sv)
    sv.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    sv.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
    sv.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0).isActive = true
    sv.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0).isActive = true
}
    func setupredView(){
        let redView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = .red
        
        mainView.addSubview(redView)
        redView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        redView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true
        redView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        let orange1View = UIView()
        orange1View.translatesAutoresizingMaskIntoConstraints = false
        orange1View.backgroundColor = .orange
        
        redView.addSubview(orange1View)
        orange1View.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 10).isActive = true
        orange1View.topAnchor.constraint(equalTo: redView.topAnchor, constant: 10).isActive = true
        orange1View.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: -10).isActive = true
        orange1View.widthAnchor.constraint(equalTo:redView.widthAnchor, multiplier: 0.55).isActive = true
    
        let orange2View = UIView()
        orange2View.translatesAutoresizingMaskIntoConstraints = false
        orange2View.backgroundColor = .orange
        
        redView.addSubview(orange2View)
        orange2View.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: -10).isActive = true
        orange2View.topAnchor.constraint(equalTo: redView.topAnchor, constant: 10).isActive = true
        orange2View.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: -10).isActive = true
        orange2View.widthAnchor.constraint(equalTo:redView.widthAnchor, multiplier: 0.33).isActive = true
        
    }
}
