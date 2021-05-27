//
//  ContentView.swift
//  Death Note
//
//  Created by Brian on 3/23/21.
//
import SwiftUI
import Foundation

import EventKit
struct ContentView: View {
    @State var hide: Bool = true
    var body: some View {
        NavigationView{
            VStack{
                Image("DEATHNOTE-TITLE")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 50)
                Text("♱") .font(Font.custom("DEATHNOTE-font", size: 200)) .foregroundColor(.white) .padding(.top, 50)
                NavigationLink(destination: rules()){
                    Text("open DEATH NOTE") .font(Font.custom("DEATHNOTE-font", size: 35)) .foregroundColor(.white) .padding(.top, 50)}
                Color.black.edgesIgnoringSafeArea(.all)
                Text("If you have issues with mental health, please call 1-800-SUICIDE").font(Font.custom("ashcanBB", size: 20))
                    .multilineTextAlignment(.center)
            } .background(Color.black)
            .colorScheme(.dark)
            .navigationBarTitle("Death Note Cover")
            .navigationBarHidden(self.hide)
            .onAppear{(self.hide = true)}
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            rules()
            write()
            paper(name: .constant("name(string)"), age: .constant("age(string)"), cause: .constant("cause(string)"))
        }
    }
}
struct rules: View{
    @State var hide: Bool = true
    var body: some View{
        NavigationView{
            VStack{
                Image("DEATHNOTE-RULES").resizable().frame(width: 400.0, height: 650.0).scaledToFit()
                    .overlay(NavigationLink(destination: write()){
                                Text("WriTe NameS") .font(Font.custom("DEATHNOTE-font", size: 40)) .foregroundColor(.white) .padding(.top, 610)})
                    .overlay(ScrollView {
                        Text("If the name is not written, this will write MYSELF causing the person who is writing in the note to die.\n\nIf the cause of death is not specified then the subject will die of a heart attack.\n\nThe time of death will take place within the next 60 seconds.\n\nYou can write the conditions of death before writing the subjects name\n\nIf you write DIES OF ACCIDENT as the cause of death, the subject will die of a natural accident\n\nIf you write, DIES FROM DISEASE as the cause of death and not the actual disease, the victim will die from a plausible disease.\n\nAny human less than 4745 days old will not be affected by the DEATH NOTE, no matter what is stated.\n\nDue to this DEATH NOTE being borrowed by said person for use, you are unable to trade half of your remaining life for the Shinigami Eyes.\n\nTo differentiate between humans with the same name, you must write their age in years.\n\nIf no age is specified, it will automatically set to 18, so whomever is of that age with that name will die.\n\nMurder is a sin. Prepare your soul for whatever happens beyond this world.") .font(Font.custom("DEATHNOTE-font", size: 40)).foregroundColor(.white)  .multilineTextAlignment(.leading).padding()
                    }
                    .padding(.top, 80.0)
                    .frame(width: 300.0, height: 500.0))
                Color.black.edgesIgnoringSafeArea(.all)
            } .background(Color.black)
        }
        .padding(.top, -94)
        .navigationBarTitleDisplayMode(.inline)
        .colorScheme(.dark)
        
    }
}
func writeMessage(){
    
}
struct write: View{
    @State var check1: Int = 0; @State var check2: Int = 0; @State var check3: Int = 0
    @State private var getAlert = false
    @State private var name: String = "Input Name"
    @State private var age: String = "Age"
    @State private var cause: String = "Cause of Death"
    let causes = ["car crash", "banana peel slip", "heart attack", "spontaneous combustion", "stroke", "sudden slip in the ice rink", "aneurism"]
    @State var allBool=false
    var size: CGFloat = (40)
    var body: some View{
        NavigationView{
            VStack{
                VStack{
                    Text("WRITE NAMES").font(Font.custom("DEATHNOTE-font", size: 25)).foregroundColor(.white)
                    Text("Input Name:") .font(Font.custom("DEATHNOTE-font", size: 20)).foregroundColor(.white).multilineTextAlignment(.leading)
                }
                VStack{
                    TextEditor(text: $name)
                        .frame(height: size+10)
                        .font(.custom("DEATHNOTE-font", size: size))
                        .modifier(clearText(text: $name))
                        .lineLimit(1)
                    Divider().background(Color.white)
                    TextEditor(text: $age)
                        .frame(height: size+10)
                        .font(.custom("DEATHNOTE-font", size: size))
                        .modifier(clearText(text: $age))
                        .lineLimit(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    Divider().background(Color.white)
                    TextEditor(text: $cause)
                        .frame(height: size+10)
                        .font(.custom("DEATHNOTE-font", size: size))
                        .modifier(clearText(text: $cause))
                        .lineLimit(1)
                    Divider().background(Color.white)
                    Text("You acknowledge that you are completely responsible for the results of the Death Note. You understand that if anything may have happened to whomever you have decided to inflict this supposed curse upon, it is not this application's fault. I will not take credit for anything that happens once you press the red 'Write Name' button below.").font(Font.custom("ashcanBB", size: 20)).multilineTextAlignment(.center)
                    Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                Button("Write Name", action: {
                    switch(name){
                    case "": name = "Myself"; check1 = 1; allBool = true
                    case "Input Name": check1 = 0;
                    case nil: name = "reading failed"; print("name: reading failed")
                    default: print("name: reading success | assigned to var"); check1 = 1; allBool = true}
                    
                    switch(age){
                    case "": age = "18"; check2 = 1; allBool = true
                    case "Age": check2 = 0;
                    case nil: age = "reading failed"; print("age: reading failed")
                    default: print("age: reading success | assigned to var"); check2 = 1; allBool = true}
                    
                    switch(cause){
                    case "": cause = "Heart Attack"; allBool = true
                    case "DIES OF ACCIDENT": cause = causes.randomElement()!; allBool = true
                    case "Cause of Death": check3 = 0;
                    case nil: cause = "reading failed"; print("cause: reading failed")
                    default: print("cause: reading success | assigned to var"); check3 = 1; allBool = true}
                    if(check1 == 1 && check2 == 1 && check3 == 1){getAlert = false; allBool = true} else{getAlert = true; allBool = false}
                }) .font(Font.custom("DEATHNOTE-font", size: 40)) .foregroundColor(.red) .actionSheet(isPresented:$getAlert) {
                    ActionSheet(title: Text("Invalid Information"), message: Text("One of the selections is invalid, to continue you must have valid information."), buttons: [.default(Text("Alright")) {print("")}])}
                .actionSheet(isPresented:$allBool) {
                    ActionSheet(title: Text("Accept Terms"), message: Text("You agree to the statement shown before you pressed 'Write Name'"), buttons: [
                                    .default(Text("Accept")) {if(check1 == 1 && check2 == 1 && check3 == 1){
                                        addtoCal(name: name, age: age, cause: cause); getAlert = false} else{getAlert = true}},
                                    .default(Text("Decline")) {print("terms declined")},
                                    .cancel()])}
                NavigationLink(destination: paper(name: $name, age: $age, cause: $cause)){
                    Text("Written Names") .font(Font.custom("DEATHNOTE-font", size: 40)) .foregroundColor(.white)}
            } .background(Color.black)
        }
        .padding(.top, -1)
        .navigationBarTitleDisplayMode(.inline)
        .colorScheme(.dark)
    }
}
struct clearText: ViewModifier {
    @Binding var text: String
    func body(content: Content)->some View {
        VStack {
            content; if !text.isEmpty {
                Button( action: {self.text = ""},
                        label: {
                            Image(systemName: "delete.left")
                                .foregroundColor(Color(UIColor.opaqueSeparator))})
            }
        }
    }
}
func addtoCal(name:String,age:String,cause:String){
    let eventStore : EKEventStore = EKEventStore()
    eventStore.requestAccess(to: .event) { (granted, error) in
        if (granted) && (error == nil) {
            print("permission \(granted)")
            print("error \(error)")
            let event:EKEvent = EKEvent(eventStore: eventStore)
            event.title = "Death Note | \(name) has died."
            event.startDate = Date().addingTimeInterval(60)
            event.endDate = Date().addingTimeInterval(360)
            event.notes = "\(name), age \(age), has died due to a\(cause)"
            event.calendar = eventStore.defaultCalendarForNewEvents
            do {
                try eventStore.save(event, span: .thisEvent)
            } catch let error as NSError {
                print("Failed: \(error)")
            }
            print("Added to Calendar")
            if UserDefaults.standard.object(forKey: "DeathKey") != nil {
                var mCause: String?
                var addToKey: String = UserDefaults.standard.string(forKey: "DeathKey")! + ("\(name), \(age); \(cause)")
                UserDefaults.standard.set(addToKey, forKey: "DeathKey")
            } else{UserDefaults.standard.set("\(name), \(age); \(cause)\n", forKey: "DeathKey")}
            print(UserDefaults.standard.string(forKey: "DeathKey"))
        }
        else{
            print("failed to save event with error:\(error), or access not granted by user")
        }
    }
}
struct paper: View{
    @Binding var name: String
    @Binding var age: String
    @Binding var cause: String
    var body: some View{
        
        NavigationView{
            VStack{
                Text("Name/Age/Cause").font(Font.custom("ashcanBB", size: 20))
                Text(UserDefaults.standard.string(forKey: "DeathKey")!).font(Font.custom("ashcanBB", size: 20)).multilineTextAlignment(.center)
                Button("Reset", action: {
                    UserDefaults.standard.set("", forKey: "DeathKey")
                }) .font(Font.custom("ashcanBB", size:20))
            }
        }
        .colorScheme(.light)
        .navigationBarTitleDisplayMode(.inline)
    }
}

