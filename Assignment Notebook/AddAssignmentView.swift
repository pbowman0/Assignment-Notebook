//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Student on 2/8/21.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date ()
    @Environment(\.presentationMode) var presentationMode
    static let course = ["AP Seminar", "Mobile Apps", "AP English RA", "AP Physics 1", "German", "Digital Electronics", "Accelerated Precalc"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course){
                    ForEach(Self.course, id:\.self) { course in Text(course)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New To-Do Item")
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: course, description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
    AddAssignmentView(assignmentList: AssignmentList())
    }
}


