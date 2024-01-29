Student.java

package my.StudentBean;
//import
@Entity
@Table(name = "Student")
public class Student {
@Id
int id;
@Column
int totalmarks;
@Column
String usn, name, address;
public int getId() {
return id;
}
public void setId(int id) {
this.id = id;
}
public int getTotalmarks() {
return totalmarks;
}
public void setTotalmarks(int totalmarks) {
this.totalmarks = totalmarks;
}
public String getUsn() {
return usn;
}
public void setUsn(String usn) {
this.usn = usn;
}
public String getName() {
return name;
}
public void setName(String name) {
this.name = name;
}
public String getAddress() {
return address;
}
public void setAddress(String address) {
this.address = address;
}
@Override
public String toString() {
return "Student [id=" + id + ", totalmarks=" + totalmarks + ", usn=" + usn + ", 
name=" + name + ", address=" + address + "]";
}
}


Student_Main.java
package my.StudentBean;
//imports
public class Student_Main {
SessionFactory sc = new
Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
Session session = sc.openSession();
Transaction t = session.beginTransaction();
public void insert(int id, String usn, String name, String address, int totalmarks) {
Student s = new Student();
s.setId(id);
s.setName(name);
s.setAddress(address);
s.setTotalmarks(totalmarks);
s.setUsn(usn);
session.save(s);
t.commit();
}
public void delete(String usn) {
Query q = session.createQuery("delete from student where usn = :usn");
q.setParameter("usn", usn);
int status = q.executeUpdate();
if (status == 0) {
System.out.println(usn + " Deleted successfully");
} else {
System.out.println(usn + " not found");
}
}
public void display() {
Query q = session.createQuery("from Student");
List l = q.getResultList();
Iterator it = l.iterator();
System.out.println("List of Students:");
while (it.hasNext()) {
Student s = (Student) it.next();
System.out.println(s.toString());
}
}
public void search(String usn) {
Query q = session.createQuery("from student where usn = :usn");
q.setParameter("usn", usn);
List l = q.getResultList();
if (l.isEmpty()) {
System.out.println("Not Found");
} else {
Iterator it = l.iterator();
System.out.println("Student Details:");
while (it.hasNext()) {
Student s = (Student) it.next();
System.out.println(s.toString());
}
}
}
public static void main(String[] args) {
Student_Main sm = new Student_Main();
Scanner sc = new Scanner(System.in); // creating object of Scanner class
lp: while (true) // labeling the while loop
{
// displaying the menu
System.out.println("1: Insert");
System.out.println("2: Delete");
System.out.println("3: Search");
System.out.println("4: Display");
System.out.println("7: exit");
System.out.print("Make your choice: ");
int ch = sc.nextInt(); // reading user's choice
switch (ch) {
case 1: // for Right Angled Triangle
System.out.print("Enter the Student Details to insert \n");
System.out.print("Enter the Student id \n");
int id = sc.nextInt();
System.out.print("Enter the Student usn \n");
String usn = sc.next();
System.out.print("Enter the Student name \n");
String name = sc.next();
System.out.print("Enter the Student address \n");
String add = sc.next();
System.out.print("Enter the Student totalmarks \n");
int tm = sc.nextInt();
sm.insert(id, usn, name, add, tm);
break;
case 2:
System.out.print("Enter student id to delete\n");
System.out.print("Enter the Student id \n");
usn = sc.next();
sm.delete(usn);
break;
case 3:
System.out.print("Enter student id to search\n");
System.out.print("Enter the Student id \n");
usn= sc.next();
sm.search(usn);
break;
case 4:
sm.display();
break;
case 7:
break lp;
default:
System.out.println("Invalid choice! Please make a valid choice. \n\n");
}
}
}
}



hibernate.cfg.xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-configuration PUBLIC
"-//Hibernate/Hibernate Configuration DTD 3.0//EN"
"http://hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
 <session-factory>
 <property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
 <property name="hibernate.connection.password">rvce</property>
 <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/student</property>
 <property name="hibernate.connection.username">root</property>
 <property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>
 <property name="hibernate.connection.pool_size">10</property> 
 <property name="show_sql">true</property>
 <property name="hibernate.hbm2ddl">create</property>
 <mapping class = "my.StudentBean.Student"/> 
 </session-factory> </hibernate-configuration>
