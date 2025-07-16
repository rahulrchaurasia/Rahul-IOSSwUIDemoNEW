//
//  SlideMenuViewController.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 24/03/25.
//

import UIKit


class SlideMenuViewController: UIViewController {
    
    // MARK: - Properties
    private var _isMenuOpen = false
    private let menuWidth: CGFloat = 300
    private var menuLeadingConstraint: NSLayoutConstraint!
    private let animationDuration = 0.3
    private var initialTouchPoint: CGPoint = .zero
    
    // Public interface for SwiftUI
    var isMenuOpen: Bool {
        get { _isMenuOpen }
        set {
            if newValue != _isMenuOpen {
                newValue ? openMenu() : closeMenu()
            }
        }
    }
    
    // MARK: - UI Components
    let mainContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let hamburgerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupGestures()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        menuLeadingConstraint.constant = -menuWidth
    }
    
    // MARK: - Setup
    private func setupViews() {
        view.addSubview(mainContentView)
        NSLayoutConstraint.activate([
            mainContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        mainContentView.addSubview(hamburgerButton)
        NSLayoutConstraint.activate([
            hamburgerButton.topAnchor.constraint(equalTo: mainContentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            hamburgerButton.leadingAnchor.constraint(equalTo: mainContentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            hamburgerButton.widthAnchor.constraint(equalToConstant: 44),
            hamburgerButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        hamburgerButton.addTarget(self, action: #selector(toggleMenu), for: .touchUpInside)
        
        view.insertSubview(menuView, belowSubview: mainContentView)
        menuLeadingConstraint = menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -menuWidth)
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuLeadingConstraint,
            menuView.widthAnchor.constraint(equalToConstant: menuWidth),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        mainContentView.layer.shadowColor = UIColor.black.cgColor
        mainContentView.layer.shadowOpacity = 0.8
        mainContentView.layer.shadowOffset = CGSize(width: -2, height: 0)
        mainContentView.layer.shadowRadius = 5
        mainContentView.layer.shadowPath = UIBezierPath(rect: mainContentView.bounds).cgPath
        mainContentView.layer.shouldRasterize = true
        mainContentView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func setupGestures() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeMenu))
        mainContentView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Actions
    @objc private func toggleMenu() {
        _isMenuOpen ? closeMenu() : openMenu()
    }
    
    @objc private func openMenu() {
        UIView.animate(withDuration: animationDuration) {
            self.menuLeadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        _isMenuOpen = true
    }
    
    @objc private func closeMenu() {
        UIView.animate(withDuration: animationDuration) {
            self.menuLeadingConstraint.constant = -self.menuWidth
            self.view.layoutIfNeeded()
        }
        _isMenuOpen = false
    }
    
    @objc private func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)
        
        switch recognizer.state {
        case .began:
            initialTouchPoint = recognizer.location(in: view)
            
        case .changed:
            let newConstant = menuLeadingConstraint.constant + translation.x
            
            if !_isMenuOpen && newConstant > -menuWidth && newConstant <= 0 {
                menuLeadingConstraint.constant = newConstant
            } else if _isMenuOpen && newConstant >= -menuWidth && newConstant <= 0 {
                menuLeadingConstraint.constant = newConstant
            }
            
            recognizer.setTranslation(.zero, in: view)
            
        case .ended, .cancelled:
            let velocity = recognizer.velocity(in: view)
            
            if velocity.x > 500 {
                openMenu()
                return
            } else if velocity.x < -500 {
                closeMenu()
                return
            }
            
            if menuLeadingConstraint.constant > -menuWidth / 2 {
                openMenu()
            } else {
                closeMenu()
            }
            
        default:
            break
        }
    }
}
