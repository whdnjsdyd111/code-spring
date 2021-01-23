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

                <div class="bigPictureWrapper">
                    <div class="bigPicture">

                    </div>
                </div>

                <style>
                    .uploadResult {
                        width: 100%;
                        background-color: gray;
                    }

                    .uploadResult ul {
                        display: flex;
                        flex-flow: row;
                        justify-content: center;
                        align-items: center;
                    }

                    .uploadResult ul li {
                        list-style: none;
                        padding: 10px;
                        align-content: center;
                        text-align: center;
                    }

                    .uploadResult ul li img {
                        width: 100px;
                    }

                    .uploadResult ul li span {
                        color: white;
                    }

                    .bigPictureWrapper {
                        position: absolute;
                        display: none;
                        justify-content: center;
                        align-items: center;
                        top: 0%;
                        width: 100%;
                        height: 100%;
                        background-color: gray;
                        z-index: 100;
                        background: rgba(255, 255, 255, 0.5);
                    }

                    .bigPicture {
                        position: relative;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                    }
                </style>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-header">Files</div>
                        <div class="card-body">
                            <div class="form-group uploadDiv">
                                <input type="file" name="uploadFile" multiple>
                            </div>
                            <div class="uploadResult">
                                <ul>
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
            } else if(operation === 'modify') {
                console.log("submit clicked");

                var str = "";

                $('.uploadResult ul li').each(function(i, obj) {
                    var jobj = $(obj);

                    console.dir(jobj);

                    str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") +"'>"
                        + "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") +"'>"
                        + "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") +"'>"
                        + "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") +"'>";
                });
                formObj.append(str).submit();
            }
            formObj.submit();
        });

        (function() {
            var bno = '<c:out value="${board.bno}"/>';

            $.getJSON("/board/getAttachList", {bno: bno}, function(arr) {
                console.log(arr);

                var str = "";

                $(arr).each(function(i, attach) {
                    // image type
                    if(attach.fileType) {
                        var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);

                        str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid +
                            "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
                        str += "<span>" + attach.fileName + "</span>";
                        str += "<button type='button' data-file=\'"+ fileCallPath + "\' data-type='image'";
                        str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button></br>";
                        str += "<img src='/display?fileName=" + fileCallPath + "'>";
                        str += "</div></li>"
                    } else {
                        str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid +
                            "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
                        str += "<span>" + attach.fileName + "</span><br/>";
                        str += "<button type='button' data-file=\'"+ fileCallPath + "\' data-type='image'";
                        str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button></br>";
                        str += "<img src='${pageContext.request.contextPath}/resources/img/attach.png'></div></li>";
                    }
                });

                $(".uploadResult ul").html(str);
            });
        })();

        $('.uploadResult').on("click", "button", function(e) {
            console.log("delete file");

            if(confirm("Remove this file?")) {
                var targetLi = $(this).closest("li");
                targetLi.remove();
            }
        });

        var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");

        var maxSize = 5242880;  // 5MB

        function checkExtension(fileName, fileSize) {
            if(fileSize >= maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }

            if(regex.test(fileName)) {
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
                return false;
            }

            return true;
        }

        $("input[type='file']").change(function(e) {
            var formData = new FormData();

            var inputFile = $("input[name='uploadFile']");

            var files = inputFile[0].files;

            for(let i = 0; i < files.length; i++) {
                if(!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: 'json',
                success: function(result) {
                    console.log(result);
                    showUploadResult(result); //    업로드 결과 처리 함수
                }
            });
        });

        function showUploadResult(uploadResultArr) {

            if(!uploadResultArr || uploadResultArr.length == 0) return;

            var uploadUL = $('.uploadResult ul');

            var str = "";

            $(uploadResultArr).each(function(i, obj) {
                // image type
                if(obj.image) {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                    str += "<li data-path='" + obj.uploadPath + "'" +
                        "data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName +
                        "' data-type='" + obj.image + "'>" +
                        "<div><span>" + obj.fileName + "</span>" +
                        "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'" +
                        " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>" +
                        "<img src='/display?fileName=" + fileCallPath + "'></div></li>"
                } else {
                    // str += "<li>" + obj.fileName + "</li>";
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

                    var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

                    str += "<li data-path='" + obj.uploadPath + "'" +
                        "data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName +
                        "' data-type='" + obj.image + "'>" +
                        "<div><span>" + obj.fileName + "</span>" +
                        "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file'" +
                        "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>" +
                        "<img src='${pageContext.request.contextPath}/resources/img/attach.png'></a>" +
                        "</div></li>";
                }
            });

            uploadUL.append(str);
        }

    });
</script>
</body>

</html>
