//
//  CalculatorView.swift
//  TestingGoJim
//
//  Created by Amaro Truong on 6/24/23.
//

import SwiftUI

struct CalculatorView: View {
    @State private var bodyWeight: String = ""
    @State private var height: String = ""
    @State private var height2: String = ""
    @State private var bmi = ""
    @State private var gender = ""
    @State private var age = ""
    @State private var mc = ""
    @State private var orm = ""
    @State private var rep = ""
    @State private var repWeight = ""
    @State private var maintainWeight = ""

    
    var body: some View {
        ZStack {
            Color("LightRed")
                .ignoresSafeArea()
            VStack {
                Group {
                    TextField("Weight(lbs)", text: $bodyWeight)
                        .padding(.bottom, 0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Height(in)", text: $height)
                        .padding(.bottom, 10)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Calculate BMI") {
                        calculateBMI()
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40)
                    .background(.black)
                    .cornerRadius(15)
                    .padding(.bottom, -5)
                    .position(x: 200, y: 20)
                    
                    Text(bmi)
                        .position(x: 200, y: -30)
                }
                
                VStack {
                    Group {
                        TextField("Weight(lbs)", text: $repWeight)
                            .padding(.bottom, 20)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        
                        TextField("Reps", text: $rep)
                            .padding(.bottom, -5)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        
                        Button("Calculate 1RM") {
                            calculate1RM()
                        }
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(.black)
                        .cornerRadius(15)
                        .padding(.bottom, -5)
                        .position(x: 200, y: 30)
                        
                        Text(orm)
                            .position(x: 200, y: 50)
                    }.position(x: 211, y: -70)
                }
                
                
                
                VStack{
                    Group {
                        
                        TextField("Age(Years)", text: $age)
                            .padding(.bottom, 0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Weight(lbs)", text: $maintainWeight)
                            .padding(.bottom, 0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Height(inches)", text: $height2)
                            .padding(.bottom, -5)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Select Gender")
                            .font(.body)
                        Picker("Gender", selection: $gender) {
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        
                        Text("Selected Gender: \(gender)")
                        
                        Button("Calculate MC") {
                            calculateMC()
                        }
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(.black)
                        .cornerRadius(15)
                        .padding()
                        
                        Text(mc)
                    }
                }
                HStack(spacing: 50) {
                    NavigationLink(destination: ThirdView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "house")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                    NavigationLink(destination: ChatView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "message.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                    
                    NavigationLink(destination: CalculatorView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "figure.strengthtraining.traditional")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                    NavigationLink(destination: RunningMapView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "map.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                }
                .position(x: 200, y: 100)
            }
        }
    }
    
    func calculate1RM() {
        guard let weightValue = Double(repWeight),
              let reps = Double(rep),
              weightValue > 0,
              reps > 0
        else {
            orm = "Invalid input"
            return
        }
        
        let oneRepMax = weightValue / ((1.0278) - (0.0278 * reps))
        orm = String(format: "Your 1 Rep Max is: %.f", oneRepMax)
    }
    
    func calculateBMI() {
        // guard is a form of input validation
        guard let weightValue = Double(bodyWeight),
              let heightValue = Double(height),
              weightValue > 0,
              heightValue > 0
        else {
            bmi = "Invalid input"
            return
        }
        
        let bmiValue = weightValue / (heightValue * heightValue) * 703
        bmi = String(format: "Your BMI is: %.1f", bmiValue)
    }
    
    
    func calculateMC() {
        if let ageValue = Double(age),
           let weightValue = Double(maintainWeight),
           let heightValue = Double(height2),
           weightValue > 0,
           heightValue > 0 {
            
            if gender == "Male" {
                mc = String(format: "Your maintenance calories is %.f", (66 + (6.23 * weightValue) + (12.7 * heightValue) - (6.8 * ageValue)))
            } else if gender == "Female" {
                mc = String(format: "Your maintenance calories is %.f", (655 + (4.35 * weightValue) + (4.7 * heightValue) - (4.7 * ageValue)))
            }
        } else {
            mc = "Invalid input"
            return
        }
    }
   
    struct CalculatorView_Previews: PreviewProvider {
        static var previews: some View {
            CalculatorView()
        }
    }
}
