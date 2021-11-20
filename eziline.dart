import 'dart:io';
//import 'dart:async';

void main() {
  var sys = '''
  |--/==================================/|
  |-/*  Attandance Management System  */-|
  |/==================================/--|
  ''';
  print(sys.toUpperCase());

  List<String> u_name = ["Start"];
  List<String> u_pass = ["Start"];
  List<String> u_attendance = ["Start"];
  List<String> attend_date = ["Start"];

  List<String> u_leave = ["Start"];
  List<String> leave_date = ["Start"];
  String login_user;

  u_name.removeAt(0);
  u_pass.removeAt(0);
  attend_date.removeAt(0);
  u_attendance.removeAt(0);
  u_leave.removeAt(0);
  leave_date.removeAt(0);

  bool check = true;
  bool logged_in = true;

  print("1. User Panel\n2. Admin Panel\n\n\tEnter your Choice: ");
  int? choice = int.parse(stdin.readLineSync()!);
  int page;

  switch (choice) {
    case 1: // User panel
      do {
        print(
            "1. Registeration \n2. Login \n3. Exit\t Enter any of the above: ");
        page = int.parse(stdin.readLineSync()!);

        switch (page) {
          case 1:
            do {
              print("Enter Username: ");
              String username = stdin.readLineSync()!;
              print("Enter Password: ");
              String password = stdin.readLineSync()!;

              if (username != "" && password != "") {
                if (!u_name.contains(username)) {
                  u_name.add(username);
                  u_pass.add(password);
                  check = false;
                } else {
                  continue;
                }
              }
            } while (check == true);

            break;

          case 2:
            print("Login Here \n");
            do {
              print("\tEnter Username: ");
              login_user = stdin.readLineSync()!;
              if (!u_name.contains(login_user)) {
                print("Username Doesn't Exist ! Please enter correct username");
                check = true;
                continue;
              } else {
                check = false;

                print("Enter Password: ");
                String login_pass = stdin.readLineSync()!;
                int index = u_name.indexOf(login_user);
                if (login_pass == u_pass[index]) {
                  logged_in = true;
                  print("Logged In Successfully!");
                } else {
                  print("Password is Incorrect. ");
                  print("Enter Correct Username and Password");
                  logged_in = false;
                  check = true;
                  continue;
                }
              }
            } while (check == true);

            logged_in = true;

            do {
              print("1. Mark Attendance\n2. Mark Leave\n3. View\n4. Log Out");
              print("\t Press Button from Above: ");
              int opt = int.parse(stdin.readLineSync()!);
              switch (opt) {
                case 1:
                  if (AlreadyPresent(u_name, u_attendance, login_user)) {
                    print("You Can't Mark Today's attendance.");
                    print("You Already Marked Today !");
                  } else {
                    u_attendance.add(login_user);
                    attend_date.add(retToday());
                    print("You've been Marked as Present Today!");
                  }
                  break;

                case 2:
                  // Mark Leave...
                  if (AlreadyPresent(u_name, u_attendance, login_user)) {
                    print("Can't mark leave! you're already present.");
                  } else {}
                  break;

                case 3:
                  // View Attendance & Leaves
                  break;
                case 4:
                  logged_in = false;
                  break;
              }
            } while (logged_in == true);

            break;
        }
      } while (page != 3);
      break;

    case 2: // Admin panel

      break;
  }

  // String? name = stdin.readLineSync();
  // print(n);
}

bool AlreadyPresent(List<String> user, List<String> attendance, String login) {
  bool isPresent = true;
  List<String> attended = ["Start"];
  attended.removeAt(0);

  for (int i = 0; i < user.length; i++) {
    if (user[i] == login) {
      attended.add(attendance[i]);
    }
  }
  for (int i = 0; i < attended.length; i++) {
    String att = attended[i];
    if (att == retToday()) {
      isPresent = true;
    } else {
      isPresent = false;
    }
  }
  return isPresent;
}

List<String> retAttendance(
    List<String> user, List<String> attendance, String login) {
  List<String> Attended = ["Start"];
  Attended.removeAt(0);

  return Attended;
}

String retToday() {
  var time = new DateTime.now();
  String day, month, year;
  day = time.day.toString();
  month = time.month.toString();
  year = time.year.toString();
  String today = day + " - " + month + " - " + year;

  return today;
}



/*


  Attendance Management System

User panel:
> User panel may include the registration page, and login
> There must be a 3 buttons , mark attendance , Mark Leave and 
  view button
> Mark attendance in which students can mark his/her attendance as 
  present
> View button in which student can view all the marked attendance
> Student which mark his/her attendance once in a day can’t mark it 
  again in as well as not delete his/her attendance.
> Also give the option to edit the profile picture
> User should be able to Send Leave Request to admin for leaves.


Admin panel:
> The admin can login through login page
> View all the record of login students
> The admin can edit, add, and delete the students attendance
> Admin should be able to create a report of Users. FROM  and TO 
  Dates which will show specific user attendance
> Leave Approval Modules. There should be proper count of Leaves , 
  Present’s  , Absents etc
> Admin should be able to create a Complete System Report FROM 
  and TO dates of all attendances
> Add up grading System, if user attended 26 Days he should have 
  A grade for other grades setting add up a module. 
  E.g.  10 Days = D grade etc. etc. in admin panel


*/