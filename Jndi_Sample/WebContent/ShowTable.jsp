<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*,
            javax.sql.*,
            javax.naming.InitialContext,
            javax.naming.Context"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  InitialContext initCon = new InitialContext(); //(1)
  DataSource ds
    = (DataSource)initCon.lookup("java:comp/env/MySQL_JDBC"); //(2)
  Connection con = ds.getConnection(); //(3)JNDIリソースへのコネクト
  Statement stmt = con.createStatement(); //(4)
  ResultSet result
    = stmt.executeQuery("select * from city;"); //(5)SQL文の実行
%>

<table border="1">
  <tr>
    <th>Country</th>
    <th>Capital</th>
  </tr>


  <%
    //(6)データの表示
    while (result.next()) {
  %>

  <tr>
    <td> <%= result.getString(1) %></td>
    <td> <%= result.getString(2) %></td>
  </tr>

  <%
    }
    //(7)コネクトのクローズ
    con.close();
    initCon.close();
  %>
</table>

</body>
</html>