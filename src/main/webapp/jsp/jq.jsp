<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/1 0001
  Time: 下午 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <%--boot核心--%>
    <link rel="stylesheet" href="${path}/boot/css/bootstrap.min.css">
    <%--引入jq主题样式--%>
    <link rel="stylesheet" href="${path}/jq/jqgrid/css/css/cupertino/jquery-ui-1.8.16.custom.css">
    <%--引入jq核心css--%>
    <link rel="stylesheet" href="${path}/jq/jqgrid/css/ui.jqgrid.css" >
    <%--引入jquery.js--%>
    <script src="${path}/boot/js/jquery-3.3.1.min.js"></script>
    <%--引入bootstrap核心js--%>
    <script src="${path}/boot/js/bootstrap.min.js"></script>
    <%--引入国际化js--%>
    <script src="${path}/jq/jqgrid/js/i18n/grid.locale-cn.js"></script>
    <%--引入jq核心--%>
    <script src="${path}/jq/jqgrid/js/jquery.jqGrid.src.js"></script>
    <script>
        $(function () {
            $("#t").jqGrid({
                url:"${path}/User/pagingQuery",
                editurl:"${path}/User/edit",
                datatype:"json",
                styleUI: "Bootstrap",
                autowidth:true,
                pager:"#pager",
                // rowNum:3,
                // rowList:[3,10,15],
                toolbar:[true,'both'],
                multiselect:true,
                caption:"我的表格",
                viewrecords:true,
                rowNum:5,
                //     private String id;
            // private String name;
            // private String password;
            // private Integer age;
            // @DateTimeFormat(pattern="yyyy-MM-dd")
            // @JsonFormat(pattern = "yyyy-MM-dd")
            // private Date birthday;
            // private String mobile;
            // private String status;
                colNames:["ID","姓名","密码","年龄","生日","手机号","状态","操作"],
                colModel:[
                    {name:"id",align:"center"},
                    {name:"name",editable:true},
                    {name:"password",editable:true},
                    {name:"age",editable:true},
                    {name:"birthday",editable:true},
                    {name:"mobile",editable:true},
                    {name:"status",editable:true},
                    {name:"option",formatter:function(cellvalue,options,rowObject){
                            return "<button class='btm btm-primary'>删除</button>";
                        }}
                ]
            }).jqGrid("navGrid","#pager",{},{reloadAfterSubmit: false, closeAfterEdit: true},
                {closeAfterAdd: true}, {closeAfterDel: true})
        })
    </script>
</head>
<body>
    <div class="page-header">
        <h3>用户管理</h3>
    </div>
    <!--标签页头部-->
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">用户列表</a></li>
        <li id="regist"><a href="#">用户添加</a></li>
    </ul>
    <table id="t"></table>
<div id="pager"></div>
</body>
</html>
