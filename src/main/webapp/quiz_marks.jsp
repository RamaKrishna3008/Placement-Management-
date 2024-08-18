<%@page import="com.klef.ep.services.*,com.klef.ep.models.*"%>
<%@page import="java.util.*"%>
<%@include file="studenthome.jsp"  %>
<%
String qname= request.getParameter("name");
DepartmentService service = new DepartmentServiceImpl();
List<Quiz> qlist = service.displayquiz(qname);
int marks=0,i=0;
for(Quiz q:qlist)
{
  i++;
  String param="crtanswer"+i;
  int option= Integer.parseInt(request.getParameter(param));
  if(service.quizmarks(q.getId(), option))
  {
    marks++;
  }
}
%>
<%
StudentService sservice = new StudentServiceImpl();
Student ss=(Student)session.getAttribute("student");
Marks m=new Marks();
m.setSid(ss.getId());
m.setStudentname(ss.getName());
m.setQuizname(qname);
m.setMarks(marks);
sservice.addMarks(m);
%>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS for animations -->
<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Roboto', sans-serif; 
    }
    h3 {
        color: #343a40;
        font-weight: bold;
        margin-top: 20px;
    }
    .styled-link {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        color: #fff;
        background-color: #007bff;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }
    .styled-link:hover {
        background-color: #0056b3;
    }
</style>
<br><br>
<center>
    <h3>Secured Marks are <%=marks%></h3>
    <a href="viewallquizes.jsp" class="styled-link">Take Another Quiz</a>
</center>
