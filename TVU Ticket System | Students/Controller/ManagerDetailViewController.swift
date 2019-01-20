//
//  ManagerDetailViewController.swift
//  TVU Ticket System | Students
//
//  Created by Pooya Taheri on 1/19/19.
//  Copyright © 2019 Pooya Taheri. All rights reserved.
//

import UIKit


class ManagerDetailViewController:UIViewController {
    
    //MARK: - Instance Property
    let imagesRoute = "https://backendlessappcontent.com/0189D3C3-383E-C1A2-FFD5-D9B7E21E6500/B9566F1A-EFF7-319C-FF27-091AD6829000/files/images/"
    var objectID:String?
    var studentTicket:StudentTicket = StudentTicket()
    let backendless = Backendless.sharedInstance()
    
    //MARK: - UI Elements
    var attachmentImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var activityIndicator:UIActivityIndicatorView!
    var detailedInfoView = ManagerDetailInfoView()
    var messageLabel:GeneralLabel = GeneralLabel(fontSize: 16.0, textAlignment: .right)
    
    //MARK: - Overridden Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    //MARK: - Helper Method
    
    
    private func setupView(){
        self.startActivityIndicator()
        view.backgroundColor = .white
        autoLayoutForManagerDetailVC()
        retreiveTicketByID()
    }
    
   
    //show activity indicator
    private func startActivityIndicator(){
        activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.transform = CGAffineTransform(scaleX: 1, y: 1)
        activityIndicator.layer.cornerRadius = 4.0
        attachmentImageView.addSubview(activityIndicator)
        activityIndicator.anchor(top: nil, leading: nil, trailing: nil, bottom: nil, height: 30, width: 30, XAxis: attachmentImageView.centerXAnchor, YAxis: attachmentImageView.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        activityIndicator.startAnimating()
    }
    
    //hide activity indicator
    private func stopActivityIndicator(){
        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
        }
    }
    
    private func retreiveTicketByID(){
        let whereClause = "objectId = " + "'\(objectID!)'"
        let queryBuilder = DataQueryBuilder()
        let dataStore = backendless?.data.of(Students.ofClass())
        queryBuilder?.setWhereClause(whereClause)
        
        dataStore?.find(queryBuilder, response: { [unowned self] (studentTickets:[Any]?) in
            if let tickets = studentTickets as? [Dictionary<String,AnyObject>]{
                self.studentTicket = StudentTicket.advanceParsingStudentTicket(tickets)
                self.setupDetailedInfoView(ticket: self.studentTicket)
            }
        }, error: { (fault) in
            
        })
        
    }
    
    private func setupDetailedInfoView(ticket:StudentTicket) {
        let generalStackView = detailedInfoView.managerDetailedInfoGeneralSatckView
        DispatchQueue.main.async { [unowned self] in
            generalStackView.st_province_Label.text = ticket.st_provinceName
            generalStackView.st_fullName_Label.text = ticket.st_fullName
            generalStackView.st_ID_Label.text = ticket.st_id
            generalStackView.st_collegeName_Label.text = ticket.st_collgeName
            generalStackView.st_course_Label.text = ticket.st_course
            generalStackView.st_grade_Label.text = ticket.st_grade
            self.messageLabel.text = ticket.st_message
            self.messageLabel.hasBorder = false
        }
        
        downloadImage(ticket: ticket)
        
    }
    
    func downloadImage(ticket:StudentTicket){
        let completeImageRoute = URL(string: "\(imagesRoute)\(ticket.st_fileName!).jpg")!
        print("\(self.imagesRoute)\(ticket.st_fileName!).jpg")
        URLSession.shared.dataTask(with: completeImageRoute) { (data, response, error) in
            if let error = error {
                print("Error:\(error.localizedDescription)")
            }
            
            if let data = data{
                
                print("Data:\(data)")
                DispatchQueue.main.async { [unowned self] in
                    self.attachmentImageView.image = UIImage(data: data)
                    self.stopActivityIndicator()
                }
            }
            
        }.resume()   //dataTask
        
    }//downloadImage
    
}//class
