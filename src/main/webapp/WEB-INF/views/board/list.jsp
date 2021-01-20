<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2021-01-13
  Time: 오전 12:32
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
                <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                    For more information about DataTables, please visit the <a target="_blank"
                                                                               href="https://datatables.net">official DataTables documentation</a>.</p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <span class="m-0 font-weight-bold text-primary">DataTables Example</span>
                        <button id="regBtn" type="button" class="btn btn-sm float-right">Register New Board</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>#번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>수정일</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>#번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>수정일</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${list}" var="board">
                                    <tr>
                                        <td><c:out value="${board.bno}" /></td>
                                        <td>
                                            <a class="move" href='${board.bno}'>
                                                    ${board.title} <b>[ ${board.replyCnt} ]</b>
                                            </a>
                                        </td>
                                        <td><c:out value="${board.writer}" /></td>
                                        <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
                                        <td><fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd" /></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="searchForm" action="/board/list" method="get">
                                        <select name="type">
                                            <option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}" />>--</option>
                                            <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}" />>제목</option>
                                            <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}" />>내용</option>
                                            <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}" />>작성자</option>
                                            <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}" />>제목 or 내용</option>
                                            <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}" />>제목 or 작성자</option>
                                            <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}" />>제목 or 내용 or 작성자</option>
                                        </select>
                                        <input type="text" name="keyword" />
                                        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                        <button class="btn btn-outline-dark">Search</button>
                                    </form>
                                </div>
                            </div>
                            <form id="actionForm" action="/board/list" method="get">
                                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                <input type="hidden" name="type" value="${pageMaker.cri.type}">
                                <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                            </form>
                            <div class="float-right">
                                <ul class="pagination">

                                    <c:if test="${pageMaker.prev}">
                                        <li class="paginate_button page-item previous">
                                            <a href="${pageMaker.startPage - 1}" class="page-link">Previous</a></li>
                                    </c:if>

                                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                        <li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? "active" : ""}">
                                            <a href="${num}" class="page-link">${num}</a></li>
                                    </c:forEach>

                                    <c:if test="${pageMaker.next}">
                                        <li class="paginate_button page-item next">
                                            <a href="${pageMaker.endPage + 1}" class="page-link">next</a></li>
                                    </c:if>
                                </ul>
                            </div>
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
</body>
<script type="text/javascript">
    $(document).ready(function() {
        var result = '<c:out value="${result}"/>';

        checkModal(result);

        history.replaceState({}, null, null);

        function checkModal(result) {
            if(result === '' || history.state) {
                return;
            }

            if(parseInt(result) > 0) {
                $('.modal-body').html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
            }

            $('#myModal').modal("show");
        }

        $('#regBtn').on("click", function() {
            self.location = "/board/register";
        });

        var actionForm = $('#actionForm');

        $('.paginate_button a').on("click", function(e) {
            e.preventDefault();

            console.log('click');

            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        });

        $('.move').on("click", function(e) {
            e.preventDefault();

            actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") +"'>");
            actionForm.attr("action", "/board/get");
            actionForm.submit();
        });

        var searchForm = $("#searchForm");

        $('#searchForm button').on("click", function(e) {
            if(!searchForm.find("option:selected").val()) {
                alert("검색 종류를 선택하세요");
                return false;
            }

            if(!searchForm.find("input[name='keyword']").val()) {
                alert('키워드를 입력하세요');
                return false;
            }

            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();

            searchForm.submit();
        });
    });
</script>
</html>
