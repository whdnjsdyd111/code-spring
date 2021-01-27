<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

        .bigPicture img {
            width: 600%;
        }
    </style>
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
                            <form role="form" action="/board/register" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                <div class="form-group">
                                    <label>Title</label><input class="form-control" name="title">
                                </div>
                                <div class="form-group">
                                    <label>Text Area</label><textarea class="form-control" rows="3" name="content" ></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Writer</label><input class="form-control" name="writer"
                                        value='<sec:authentication property="principal.username" />' readonly>
                                </div>
                                <button type="submit" class="btn btn-outline-dark">Submit Button</button>
                                <button type="reset" class="btn btn-outline-dark">Reset Button</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">

                            <div class="card-header">File Attach</div>
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
<script>
    $(document).ready(function(e) {
        var formObj = $("form[role='form']");

        $("button[type='submit']").on("click", function(e) {
            e.preventDefault();

            console.log("submit clicked");

            var str = "";

            $('.uploadResult ul li').each(function(i, obj) {
                var jobj = $(obj);

                console.log(jobj);

                str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") +"'>"
                    + "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") +"'>"
                    + "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") +"'>"
                    + "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") +"'>"
            });

            formObj.append(str).submit();
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

        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

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
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
                },
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

        $('.uploadResult').on("click", "button", function(e) {
            console.log("delete file");

            var targetFile = $(this).data('file');
            var type = $(this).data("type");
            var targetLi = $(this).closest("li");

            $.ajax({
                url: '/deleteFile',
                data: {fileName: targetFile, type: type},
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
                },
                dataType: 'text',
                type: 'POST',
                success: function(result) {
                    alert(result);
                    targetLi.remove();
                }
            });
        });
    });
</script>
</body>

</html>
