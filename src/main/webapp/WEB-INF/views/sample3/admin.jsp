<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2021-01-24
  Time: 오전 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>/sample3/admin page</h1>

<p>principal : <sec:authentication property="principal" /></p>
<p>MemberVO : <sec:authentication property="principal.member" /></p>
<p>사용자이름 : <sec:authentication property="principal.member.userName" /></p>
<p>사용자아이디 : <sec:authentication property="principal.member.userid" /></p>
<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList" /></p>

<a href="/customLogout">Logout</a>
</body>
</html>
