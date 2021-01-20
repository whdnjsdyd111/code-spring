<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2021-01-13
  Time: 오후 1:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="../includes/sidebar.jsp"%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="../includes/header.jsp"%>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Board Register</h1>
                <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                    For more information about DataTables, please visit the <a target="_blank"
                                                                               href="https://datatables.net">official DataTables documentation</a>.</p>

                <!-- Board Register -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-header">Board Modify</div>
                        <div class="card-body">
                            <form role="form" action="/board/modify" method="post">
                                <!-- 추가 -->
                                <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
                                <input type="hidden" name="pageNum" value='<c:out value="${cri.amount}"/>'>
                                <input type="hidden" name="type" value="${cri.type}">
                                <input type="hidden" name="keyword" value="${cri.keyword}">
                                <div class="form-group">
                                    <label>Bno</label>
                                    <input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly>
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input class="form-control" name="title" value='<c:out value="${board.title}"/>'>
                                </div>
                                <div class="form-group">
                                    <label>Text Area</label>
                                    <textarea class="form-control" rows="3" name="content"><c:out value="${board.content}"/></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Writer</label>
                                    <input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly>
                                </div>
                                <div class="form-group">
                                    <label>RegDate</label>
                                    <input class="form-control" name="regDate" value='<fmt:formatDate value="${board.regdate}" pattern="yyyy/MM/dd"/>' readonly >
                                </div>
                                <div class="form-group">
                                    <label>Update Date</label>
                                    <input class="form-control" name="regDate" value='<fmt:formatDate value="${board.updateDate}" pattern="yyyy/MM/dd"/>' readonly >
                                </div>
                                <button type="submit" data-oper="modify" class="btn btn-outline-dark">Modify</button>
                                <button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
                                <button type="submit" data-oper="list" class="btn btn-info">List</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="../includes/footer.jsp"%>

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->
<script type="text/javascript">
    $(document).ready(function() {
        var formObj = $('form');

        $('button').on('click', function(e) {
            e.preventDefault();

            var operation = $(this).data("oper");

            console.log(operation);

            if(operation === 'remove') {
                formObj.attr("action", "/board/remove");
            } else if(operation === 'list') {
                // move to list
                formObj.attr("action", "/board/list").attr("method", "get");
                var pageNumTag = $("input[name='pageNum']").clone();
                var amountTag = $("input[name='amount']").clone();
                var keywordTag = $("input[name='keyword']").clone();
                var typeTag = $("input[name='type']").clone();

                formObj.empty();
                formObj.append(pageNumTag);
                formObj.append(amountTag);
                formObj.append(keywordTag);
                formObj.append(typeTag);
            }
            formObj.submit();
        });
    });
</script>
</body>

</html>
