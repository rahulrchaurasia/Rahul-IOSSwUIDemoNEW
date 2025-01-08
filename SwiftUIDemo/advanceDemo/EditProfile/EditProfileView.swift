//
//  EditProfileView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 28/05/24.
//

import SwiftUI



struct EditProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var profileVM = ProfileViewModel.shared
    
    @State private var showCountryPicker = false

    @StateObject private var dateVM = DatePickerViewModel()

    
    @FocusState private var focusedField : ProfileField?
    
    @State private var nameIsError = false
    
    var body: some View {
        

            ZStack{
                
              //  ScrollView{
                   
                    VStack{
                        
                         headerView
                        .padding(.top,.topInsets)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color.lightWhite)
                            .frame(height: 8)
                            .padding(.bottom, 15)
                        
                        
                       
                        ScrollView{
                            formFields
                                .padding(.horizontal,20)
                        }
                        
                        .frame(maxHeight: .infinity) // Fill remaining space
                        //.adaptsToKeyboard()
                        .keyboardManagment()
                        //Button
                        customButton
                        .padding(.horizontal,20)
                        .padding(.vertical, 10)
                        .padding(.bottom,.bottomInsets)
                        
                    }
                    .disableWithOpacity(profileVM.isLoading)
                    
                    if profileVM.isLoading {

                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(2)
                    }
              //  }
               
            }
        
            .alert("Title", isPresented: $profileVM.showError, actions: { //
                Button("OK", role:.none, action: {})

            }, message: {
               
                Text(profileVM.errorMessage ?? "")

            })
           
            .navigationTitle("")
         
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true) // Hides the default back button
            .ignoresSafeArea()
            
        
            .onAppear{
                
                profileVM.resetFields()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                   
                    self.focusedField = .name
                }
             }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                   
                    if(focusedField == .mobileNo
                       || focusedField == .phoneNo
                       || focusedField == .refernce
                    ){
                        Button("Done"){
                        
                            focusedField = nil
                            print("Done Click")
                        }.tint(.brown)
                      
                    }
                  
                    
                    Spacer()
                    Button {
                        print("Previous Click")
                      previous()
                    } label: {
                      Image(systemName: "chevron.up")
                    }.padding(.horizontal)

                    Button {
                        print("next Click")
                      next()
                    } label: {
                      Image(systemName: "chevron.down")
                    }.padding(.horizontal)

                }
                
                
                
            }
            .onSubmit {
                handleSubmitLabel()
            }
          
       
    }
}

private extension EditProfileView {
 
    
    
    
    
    func handleSubmitLabel(){
        
        switch focusedField {
            
        case .name :
            focusedField = .email
            
        case .email :
            focusedField = .mobileNo
            
        case .mobileNo :
            focusedField = .phoneNo
            
       
        case .address :
            focusedField = .refernce
            
        
        case .refernce :
            
            focusedField = nil
            if(profileVM.validAction()){
                
                callProfileApi()
            }
    
            
        default :
            print("Done")
            
            
        }
        
    }
}

extension EditProfileView{
    
    private var headerView: some View {
        ZStack {
            
            Text("Edit profile")
                .font(.customfont(.extraBold, fontSize: 25))
            
            HStack{
                
                Button {
                    
                    dismiss()
                } label: {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                        .tint(Color.gray)
                        .frame(width: 25, height: 25)
                }
               
                Spacer()

            }
            
        }
       }
    
    
    private var formFields: some View {
         
        VStack(alignment: .leading, spacing: 0, content: {
           
            // we already define submitLabel on LineText Class
            LineTextField(title: "Enter Name", placholder: "Please Enter Name", text: $profileVM.txtName,
                    isError: profileVM.hasError(for: .name),
                          errorMessage: profileVM.errorMessage)
               
                .focused($focusedField, equals: .name)
                .limitInputLength(value: $profileVM.txtName, length: 20)
                
                .textContentType(.name)
                .keyboardType(.namePhonePad)
                .submitLabel(.next)
                
               
                .padding(.bottom,8)
                
            
            
            LineTextField(title: "Email", placholder: "Please Enter Email", text: $profileVM.txtEmail, keyboardType: .emailAddress , isError: profileVM.hasError(for: .email),
                errorMessage: profileVM.errorMessage)
                .limitInputLength(value: $profileVM.txtEmail, length: 20)
                .padding(.bottom,8)
                .focused($focusedField,equals: .email)
                .textContentType(.emailAddress)
                .submitLabel(.next)
//                .onSubmit {
//                   
//                    focusedField = .mobileNo
//                }
            
            
            LineTextField(title: "Enter Mobile", placholder: "Please Enter Mobile", text: $profileVM.txtMobile ,keyboardType: .phonePad ,isError: profileVM.hasError(for: .mobileNo))
                  .textContentType(.telephoneNumber)
                  .limitDigitInput(value: $profileVM.txtMobile, length:10)
                .focused($focusedField, equals: .mobileNo)
                
                
                .submitLabel(.next)
//                .onSubmit {
//                    focusedField = .phoneNo
//                }
                .padding(.bottom,8)
 
            Divider()
                .background(Color.blue)
                .padding(.bottom, 15)
                .padding(.top, 15)
            
            
            // Gender field
            genderSelection
            
            // Date Picker
             datePicker
            
            // Address
            addressDtl
            
          
            
                               
        })
        .foregroundStyle(Color.primaryText)
       
        }
    
   
}

//subChild
extension EditProfileView{
    
    private var genderSelection: some View {
        
        VStack{
            
            Text("Gender")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(.placeholder)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)

            
             HStack {
              
                Button {
                    profileVM.isMale = true
                } label: {
                   
                    Image(systemName: profileVM.isMale ?
                          "record.circle" : "circle")
                    Text("Male")
                }
                .frame(maxWidth: .infinity, alignment: .leading)

               
                Button {
                    profileVM.isMale = false
                } label: {
                  
                  Image(systemName: !profileVM.isMale ?
                        "record.circle" : "circle")
                    Text("FeMale")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)

            }
            .padding(.vertical, 8)
        }
      
        
    }
    
    
    private var datePicker: some View {
        
        VStack(alignment: .leading, spacing: 10) {
         
//                        Text("Selected date: \(formattedDate)")
//                                        .padding()

//                        DatePicker("Selecte Date", selection: $profileVM.selectedDate, displayedComponents: .date)
            
            Text("Select Date:")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(.placeholder)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)

            DatePicker("Selecte Date", selection:
                        
                        $dateVM.selectedDate,  in:   dateVM.getDateRange(),
            displayedComponents: [.date])
            .labelsHidden()  //Hide the label
    
            Text( dateVM.formattedDate(.now))
                            .padding()
            Divider()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 1)
                .background(Color.blue)
                .padding(.bottom,10)
            
            DatePicker("Selecte DOB", selection: $dateVM.selectedDate,  in:   dateVM.getmaxDateRange(),
            displayedComponents: [.date])
          
            DatePicker("Selecte Date", selection: $dateVM.selectedDate,  in:   dateVM.getmaxDateRange(),
            displayedComponents: [.date])
    
            
        }
        
    }
    
    private var addressDtl: some View {
     
        VStack(alignment: .leading, spacing: 0) {
        
            
            TextField("Phone Number", text: $profileVM.txtPhone )
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .lineLimit(1)
                .focused($focusedField,equals: .phoneNo)
                .submitLabel(.next)
                .padding(.bottom,10)
                .padding(.top,10)
            
                .limitDigitInput(value: $profileVM.txtPhone, length:10)
               
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
               // .modifier(NumbersOnly())
              
            
            Text("Address")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(.placeholder)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            TextEditor(text: $profileVM.txtAdderess)
                .frame(width: getWidth*0.85, height: 100, alignment: .leading)
                .foregroundStyle(Color.primaryText)
                .background(Color(.systemGray))
                .border(
                    profileVM.hasError(for: .address)
                    ? Color.red : Color.systemGray5,
                    width: 2
                )
                .cornerRadius(2, corner: [.bottomLeft,.bottomRight])
                .shadow(
                    color: profileVM.hasError(for: .address)
                    ? Color.red : Color.gray,
                    
                    radius: 1, x: 1,y: 1)
                .focused($focusedField,equals: .address)
                .padding(.bottom,15)
                .submitLabel(.next)
//                .onSubmit {
//                  
//                    focusedField = nil
//                    self.hideKeyboard()
//                }

    
            
            LineTextField(title: "Enter Ref", placholder: "Please Enter Ref", text: $profileVM.txtRef,
                          keyboardType: .phonePad,
                          isError: profileVM.hasError(for: .refernce))
                .focused($focusedField, equals: .refernce)
                .keyboardType(.numberPad)
                .limitInputLength(value: $profileVM.txtRef, length: 5)
                .submitLabel(.return)
//                .onSubmit {
//                    focusedField = nil
//                }
                .padding(.bottom,8)
        }
        
        
    }
    
    private var customButton: some View {
        
        //Save Button
        CustomButton(title: "SAVE") {
           
            print("Done")
            self.hideKeyboard()

            if(profileVM.validAction1()){
                
                callProfileApi()
            }
            
           
        }
        
    }
}

extension EditProfileView{
    
    
    func callProfileApi() {
        
      
       
        Task{
            do  {
                
               try await  profileVM.fetchUserData(email: "umesh@gmail.com")
             
                
                
            } catch {
                
               // handleAPIError(error)
            }
        }
        
    }
}



private extension EditProfileView {
    
    
    
    
    func next(){
        
        guard let currentInput = focusedField,
              let lastIndex = ProfileField.allCases.last?.rawValue else{return}
        
        
        let index = min(currentInput.rawValue + 1 , lastIndex )
        
        self.focusedField = ProfileField(rawValue: index)
    }
    
    func previous(){
        
        guard let currentInput = focusedField,
              let lastIndex = ProfileField.allCases.first?.rawValue else{return}
        
        //max(-1,0 ) give = 0 so it will not go out of range
        let index = max(currentInput.rawValue - 1 , lastIndex )
      
        self.focusedField = ProfileField(rawValue: index)
    }
}

#Preview {
    EditProfileView()
}
