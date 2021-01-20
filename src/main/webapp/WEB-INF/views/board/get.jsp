<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <div class="card-header">Board Register</div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>Bno</label>
                                <input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly>
                            </div>
                            <div class="form-group">
                                <label>Text Area</label>
                                <textarea class="form-control" rows="3" name="content" readonly><c:out value="${board.content}"/></textarea>
                            </div>
                            <div class="form-group">
                                <label>Writer</label>
                                <input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly>
                            </div>
                            <button data-oper="modify" class="btn btn-outline-dark">
                                <a href='/board/modify?bno=<c:out value="${board.bno}"/>'>
                                    Modify
                                </a>
                            </button>
                            <button data-oper="list" class="btn btn-info">
                                <a href="/board/list">
                                    List
                                </a>
                            </button>
                            <form id="operForm" action="/board/modify" method="get">
                                <input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
                                <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
                                <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
                                <input type="hidden" name="type" value="${cri.type}">
                                <input type="hidden" name="keyword" value="${cri.keyword}">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <i class="fa fa-comments fa-fw"></i> Reply
                                <button id="addReplyBtn" class="btn btn-primary btn-sm float-right">New Reply</button>
                            </div>
                            <div class="card-body">
                                <ul class="list-group">
                                    <li class="list-group-item clearfix" data-rno="12">
                                        <div>
                                            <div class="header">
                                                <strong class="primary-font">user00</strong>
                                                <small class="float-right text-muted">2021-01-07 20:16</small>
                                            </div>
                                            <p>Good Job!</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-footer">
                                <ul class="list-group">

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
<!-- Modal -->
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">REPLY MODAL</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Reply</label>
                    <input class="form-control" name="reply" value="New Reply!!!">
                </div>
                <div class="form-group">
                    <label>Replyer</label>
                    <input class="form-control" name="replyer" value="replyer">
                </div>
                <div class="form-group">
                    <label>Reply Date</label>
                    <input class="form-control" name="replyDate" value="">
                </div>
            </div>
            <div class="modal-footer">
                <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
                <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
                <button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
                <button id="modalCloseBtn" class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- End of Page Wrapper -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script type="text/javascript">

    console.log("==========")
    console.log("JS TEST");

    var bnoValue = '<c:out value="${board.bno}"/>';

    // for replyService add test
    /*
    replyService.add(
        {reply: "JS Test", replyer: "tester", bno: bnoValue},
        function(result) {
            alert("RESULT: " + result);
        }
    );
     */

    // reply List test
    /*
    replyService.getList({bno: bnoValue, page: 1}, function(list) {
        for(let i = 0, len = list.length || 0; i < len; i++) {
            console.log(list[i]);
        }
    });
    */

    // 12번 댓글 삭제 테스트
    /*
    replyService.remove(12, function(count) {
        console.log(count);

        if(count === 'success') {
            alert("REMOVED");
        }
    }, function(err) {
        alert("ERROR...");
    });
    */

    // 11번 댓글 수정
    /*
    replyService.update({
        rno: 22,
        bno: bnoValue,
        reply: "Modified Reply..."
    }, function(result) {
        alert("수정 완료...");
    });
    */

    /*
    replyService.get(11, function(data) {
        console.log(data);
    });
    */

    var replyUL = $('.list-group');

    showList(1);

    function showList(page) {

        console.log("show list " + page);

        replyService.getList({bno: bnoValue, page: page || 1}, function(replyCnt, list) {

            console.log("replyCnt: " + replyCnt);
            console.log("list: " + list);
            console.log(list);

            if(page == -1) {
                let pageNum = Math.ceil(replyCnt / 10.0);
                showList(pageNum);
                return;
            }

            var str = "";
            if(list == null || list.length == 0) {
                replyUL.html("");
                return;
            }

            for(let i = 0, len = list.length || 0; i < len; i++) {
                str += "<li class='list-group-item clearfix' data-rno='" + list[i].rno + "'>";
                str += "<div><div class='header'><strong class='text-primary'>[" + list[i].rno + "]" + list[i].replyer + "</strong>";
                str += "<small class='float-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
                str += "<p>" + list[i].reply + "</p></div></li>";
            }

            replyUL.html(str);

            showReplyPage(replyCnt);
        });
    }

    var modal = $('#replyModal');
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");

    var modalModBtn = $('#modalModBtn');
    var modalRemoveBtn = $('#modalRemoveBtn');
    var modalRegisterBtn = $('#modalRegisterBtn');

    $('#addReplyBtn').on("click", function(e) {
        modal.find("input").val("");
        modalInputReplyDate.closest("div").hide();
        modal.find("button[id != 'modalCloseBtn']").hide();

        modalRegisterBtn.show();

        $("#replyModal").modal("show");
    });

    modalRegisterBtn.on("click", function(e) {

        let reply = {
            reply: modalInputReply.val(),
            replyer: modalInputReplyer.val(),
            bno: bnoValue
        };

        replyService.add(reply, function(result) {
            alert(result);

            modal.find("input").val();
            modal.modal("hide");

            // showList(1);
            showList(-1);
        });
    });

    // 댓글 조회 클릭 이벤트 처리
    $(".list-group").on("click", "li", function(e) {
        let rno = $(this).data("rno");

        replyService.get(rno, function(reply) {
            modalInputReply.val(reply.reply);
            modalInputReplyer.val(reply.replyer);
            modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
                .attr("readonly", "readonly");
            modal.data("rno", reply.rno);

            modal.find("button[id != 'modalCloseBtn']").hide();
            modalModBtn.show();
            modalRemoveBtn.show();

            $('#replyModal').modal("show");
        });
    });

    modalModBtn.on("click", function(e) {
        var reply = {rno: modal.data('rno'), reply: modalInputReply.val()};

        replyService.update(reply, function(result) {
            alert(result);
            modal.modal("hide");
            showList(pageNum);
        });
    });

    modalRemoveBtn.on("click", function(e) {
        var rno = modal.data("rno");

        replyService.remove(rno, function(result) {
            alert(result);
            modal.modal("hide");
            showList(pageNum);
        });
    });

    var pageNum = 1;
    var replyCardFooter = $('.card-footer');

    function showReplyPage(replyCnt) {
        var endNum = Math.ceil(pageNum / 10.0) * 10;
        var startNum = endNum - 9;

        var prev = startNum != 1;
        var next = false;

        if(endNum * 10 >= replyCnt) {
            endNum = Math.ceil(replyCnt / 10.0);
        }

        if(endNum * 10 < replyCnt) {
            next = true;
        }

        var str = "<ul class='pagination float-right'>";

        if(prev) {
            str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
        }

        for(let i = startNum; i <= endNum; i++) {
            var active = pageNum == i ? "active" : "";

            str += "<li class='page-item " + active +"'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
        }

        if(next) {
            str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
        }

        str += "</ul></li>";

        console.log(str);

        replyCardFooter.html(str);
    }

    replyCardFooter.on("click", "li a", function(e) {
        e.preventDefault();

        let targetPageNum = $(this).attr("href");

        console.log("targetPageNum: " + targetPageNum);

        pageNum = targetPageNum;

        showList(pageNum);
    });

</script>
<script type="text/javascript">
    $(document).ready(function() {
        var operForm = $('#operForm');

        $("button[data-oper='modify']").on("click", function(e) {
            operForm.attr("action", "/board/modify").submit();
        });

        $("button[data-oper='list']").on("click", function(e) {
            operForm.find('#bno').remove();
            operForm.attr("action", "/board/list");
            operForm.submit();
        });
    });
</script>
</body>

</html>
