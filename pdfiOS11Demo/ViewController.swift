//
//  ViewController.swift
//  pdfiOS11Demo
//
//  Created by Tinnell, Clay on 9/22/17.
//  Copyright © 2017 Tinnell, Clay. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    
    var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfView = PDFView()
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        
        //make it take the full screen
        pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        if let url = Bundle.main.url(forResource: "syllabus", withExtension: "pdf") {
            pdfView.document = PDFDocument(url: url)
        }
        
        let printButton = UIBarButtonItem(title: "Print Selected", style: .plain, target: self, action: #selector(printButtonPressed))
        let firstPageButton = UIBarButtonItem(title: "First", style: .plain, target: self, action: #selector(firstPageButtonPressed))
        let lastPageButton = UIBarButtonItem(title: "Last", style: .plain, target: self, action: #selector(lastPageButtonPressed))
        
        navigationItem.rightBarButtonItems = [printButton, lastPageButton, firstPageButton]
    }

    @objc func firstPageButtonPressed() {
        pdfView.goToFirstPage(nil)
    }
    
    @objc func lastPageButtonPressed() {
        pdfView.goToLastPage(nil)
    }
    
    @objc func printButtonPressed() {
        print(pdfView.currentSelection ?? "No selection")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

