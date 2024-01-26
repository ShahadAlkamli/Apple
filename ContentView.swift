//
//  ContentView.swift
//  AppleDeveloperAcademy
//
//  Created by Shahad Saeed on 26/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var fadeIn = false
    @State private var pulsate = false
    @State private var showContactInfo = false
    @State private var selectedContact: ContactType?

    enum ContactType {
        case call
        case email
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.purple.opacity(0.9), Color.black.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Greetings!")
                    .font(.custom("Chalkduster", size: 40))
                    .foregroundColor(.black)
                    .opacity(fadeIn ? 1 : 0)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1).delay(0.5)) {
                            fadeIn.toggle()
                        }
                    }
                    .padding(.top, 40)

                Spacer()

                VStack {
                    Text("""
                    I'm Shahad Alkamli, currently pursuing a Master's in IT at King Saud University.
                    
                    My journey in Cybersecurity at the MCIT has provided me with valuable insights. I am also proud to showcase my professional growth attained during my training at the Apple Developer Academy.
                    
                    I'm proficient in Swift, Java, and Python. Beyond coding, I'm deeply passionate about AI. I've authored impactful scintific papers in both AI and Cybersecurity, soon to be published in reputable journals.
                        
                    I look forward to the opportunity to contribute my skills and expertise to your team, bringing a blend of technical proficiency and creative insight.
                    """)
                    .foregroundColor(.white)
                    .lineSpacing(5)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.black.opacity(0.9))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 2)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                            )
                    )
                    .padding(10)
                    .fixedSize(horizontal: false, vertical: true)
                }

                Spacer()

                HStack(spacing: 60) {
                    ContactButton(imageName: "phone.fill", action: {
                        showContactInfo.toggle()
                        selectedContact = .call
                    })

                    ContactButton(imageName: "envelope.fill", action: {
                        showContactInfo.toggle()
                        selectedContact = .email
                    })
                }
                .padding()

                Spacer()

                contactInfoOverlay()
                    .padding(.top, -20)
                    .padding(.bottom, 30)

            }
        }
    }

    @ViewBuilder
    func contactInfoOverlay() -> some View {
        if showContactInfo {
            VStack(spacing: 20) {
                switch selectedContact {
                case .call:
                    Text("Feel free to call me at +966509960310")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)


                case .email:
                    Text("You can also reach out via email at shahad.s.alkamli@gmail.com")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)

                default:
                    EmptyView()
                }
            }
            .padding()
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContactButton: View {
    var imageName: String
    var action: () -> Void

    var body: some View {
        Image(systemName: imageName)
            .font(.system(size: 24))
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(
                Circle()
                    .fill(Color.black.opacity(0.9))
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                            .mask(Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                    )
            )
            .onTapGesture(perform: action)
    }
}
