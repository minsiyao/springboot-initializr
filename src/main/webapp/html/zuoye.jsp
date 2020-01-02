<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/boot/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/boot/js/bootstrap.min.js"></script>
    <title>Document</title>
    <script>
        function init(item) {
            $("#myTable").append("<tr>" +
                "<td>"+item.id+"</td>" +
                "<td>"+item.name+"</td>" +
                "<td>"+item.password+"</td>" +
                "<td>"+item.birthday+"</td>" +
                "<td>"+item.mobile+"</td>" +
                "<td>"+item.status+"</td>" +
                "<td>操作</td>" +
                "<td><input type='button' id='"+item.id+"' onclick='update(this)' value='修改'/><input type='button' name='"+item.id+"' onclick='deleteById(this)'  value='删除' </td>" +
                "</tr>")
        }
        <%--查询所有并添加到表格--%>
        function queryAll(){
            $("#myTable").empty()
            $.post("${pageContext.request.contextPath}/User/queryAll",
                function (result) {
                    $.each(result,function (index,item) {
                        init(item)
                    })

                },"json"
            )
        }
        //删除用户
        function deleteById(name){
            $.get("${pageContext.request.contextPath}/User/deleteUser?id="+$(name).attr("name"))
            queryAll()
        }
        //模糊查询
        function fuzzyQuery(){
            $("#myTable").empty()
            $.get("${pageContext.request.contextPath}/User/fuzzyQuery?name="+$("#name").val()
                +"&mobile="+$("#mobile").val()
                +"&status="+$("#status").val(),
                function (result) {
                $.each(result,function (index,item) {
                    init(item)
                })

                },"json"
            )
        }
        //修改数据回显
        function update(id){
            $("#modalTitle").text("修改用户")
            $("#myModal").modal("show")
            $("#modalFooter").text("修改")
            var id = $(id).attr("id")
            $("#modalId").attr("value",id)
            //数据回显
            $.post("${pageContext.request.contextPath}/User/selectById?id="+id,
                function (result) {
                console.log(result)
                    $("#modalName").attr("value",result.name)
                    $("#modalPassword").attr("value",result.password)
                    $("#modalAge").attr("value",result.age)
                    $("#modalBirthday").attr("value",result.birthday)
                    $("#modalMobile").attr("value",result.mobile)
                    console.log($("#modalStatus option:selected").attr("value"))
                    if(result.status!=$("#modalStatus option:selected").attr("value")){
                        $("#modalStatus").val("未激活");
                    }
                },"json"
            )
        }

        $(function () {
            //不让modal默认加载
            $("#myModal").modal({
                show:false
            })
            //点击加载添加modal
            $("#regist").click(function () {
                $("#modalTitle").text("添加用户")
                $("#myModal").modal("show")
                $("#modalFooter").text("添加")
            })
            //提交模态框
            $("#modalFooter").click(function () {
                //修改用户
                if($("#modalTitle").text()=="修改用户"){
                    var ss = $("#myForm").serialize()
                    $.post("${pageContext.request.contextPath}/User/updateUser",
                        ss
                    )
                }
                //添加用户
                if($("#modalTitle").text()=="添加用户"){
                    var ss = $("#myForm").serialize()
                    console.log(ss)
                    $.post("${pageContext.request.contextPath}/User/addUser",
                        ss,
                        // "name="+$("#modalName").val()+"&password="+$("#modalPassword").val()+"&age="+$("#modalAge").val()+"&birthday="+$("#modalBirthday").val()+"&mobile="+$("#modalMobile").val()+"&status="+$("#modalStatus").val()
                        function (result) {
                            alert("fdsa")
                        },"json"
                    )
                }
                $("#myForm")[0].reset()
                queryAll()
            })

            $("#modalClose").click(function () {
                $("#myForm")[0].reset()
            })

        })
    </script>



</head>
<body>

<!--导航栏-->

<nav class="navbar navbar-default" style="background-color: #0f0f0f">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">后台管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">欢迎:小黑</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>退出登入</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>



    <!--<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>-->
    <!--<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>-->
    <!--<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>-->
    <!--<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>-->
<!--<div class="tab-content">-->
    <!--<div role="tabpanel" class="tab-pane active" id="home1">范德萨发生大发所发生的</div>-->
    <!--<div role="tabpanel" class="tab-pane" id="profile">热武器若翁拖无群热无群</div>-->
    <!--<div role="tabpanel" class="tab-pane" id="messages">包出现必须支持V型初步形成V型从</div>-->
    <!--<div role="tabpanel" class="tab-pane" id="settings">机房国际化度用心良苦i</div>-->
<!--</div>-->
<!--分行-->
<div class="row">
    <!--左栏开始-->
    <div class="col-sm-2 text-center">
        <br/><br/>
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a href="#collapseOne" role="button" data-toggle="collapse" data-parent="#accordion"  aria-expanded="true" aria-controls="collapseOne">
                            用户管理
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                            <button  type="button" role="presentation" class="btn btn-default navbar-btn" style="background-color: red;width: 100%;" ><a href="javascript:void(0)" onclick="$('#home').load('${pageContext.request.contextPath}/jsp/jq.jsp')" aria-controls="home" role="tab" data-toggle="tab"><span style="color: white" >用户列表</span></a></button>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            类别管理
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            图书管理
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
        </div>


    </div>


<!--中心-->
    <div class="col-sm-9 container">
        <%--标签容器--%>
        <div class="tab-content" id="myContent">
            <%--第一页开始--%>
         <div role="tabpanel" class="tab-pane active" id="home">
             <br/><br/>
        <!--111111111111-->
        <div class="jumbotron">
            <h1>Hello, world!</h1>
            <p>...</p>
            <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
        </div>
        <!--22222222222222-->
        <div class="alert alert-danger alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
            <h4>Oh snap! You got an error!</h4>
            <p>Change this and that and try again. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>
            <p>
                <button type="button" class="btn btn-danger">Take this action</button>
                <button type="button" class="btn btn-default">Or do this</button>
            </p>
        </div>
        <!--33333333333333-->
        <div class="panel panel-default">
            <div class="panel-heading">系统状态</div>
            <div class="panel-body">
                内存使用率
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                        <span class="sr-only">40% Complete (success)</span>
                    </div>
                </div>
                数据库使用率
                <div class="progress">
                    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                        <span class="sr-only">20% Complete</span>
                    </div>
                </div>
                磁盘使用率
                <div class="progress">
                    <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                        <span class="sr-only">60% Complete (warning)</span>
                    </div>
                </div>
                cpu使用率
                <div class="progress">
                    <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                        <span class="sr-only">80% Complete (danger)</span>
                    </div>
                </div>
            </div>
        </div>
         </div>
            <!--页面二-->
            <div role="tabpanel" class="tab-pane" id="profile">
                <div class="page-header">
                    <h3>用户管理</h3>
                </div>
            <!--标签页头部-->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">用户列表</a></li>
                <li id="regist"><a href="#">用户添加</a></li>
            </ul>
            <!--带标题的面板-->
            <div class="panel panel-default">
                <div class="panel-heading" >
                    <form action="#" class="form-inline text-center">
                        <div class="form-group" >
                            <label for="name"><h4><strong>姓名</strong></h4></label>
                            <input type="text" class="form-control" id="name">
                        </div>
                        <div class="form-group">
                            <label for="mobile"><h4><strong>手机</strong></h4></label>
                            <input type="text" class="form-control" id="mobile">
                        </div>
                        <div class="form-group">
                            <label for="status"><h4><strong>激活状态</strong></h4></label>
                            <select name="" id="status" class="form-control">
                                <option value="激活">激活</option>
                                <option value="未激活">未激活</option>
                            </select>
                        </div>
                        <button type="submit" onclick="fuzzyQuery()" class="btn btn-primary">查询</button>
                    </form>
                </div>
                <div class="panel-body">
                    <table id="myTable" class="table table-striped table-bordered">
                        <tr>
                            <td>id</td>
                            <td>姓名</td>
                            <td>密码</td>
                            <td>生日</td>
                            <td>手机</td>
                            <td>状态</td>
                            <td>操作</td>
                        </tr>
                    </table>
                </div>
            </div>
            </div>
    </div>
    </div>
</div>

<form action="javascript:void(0)" method="post" class="form-inline text-center" id="myForm">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modalTitle"></h4>
            </div>

            <div class="modal-body">

                    <div class="row">
                    <div class="">
                        <input name="id" id="modalId" value="" hidden/>
                        姓名 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input class="form-control" type="text" id="modalName" name="name"><br/><br/>
                        密码 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input class="form-control" type="text" id="modalPassword" name="password"><br/><br/>
                        年龄 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input class="form-control" type="text" id="modalAge" name="age"><br/><br/>
                        生日 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input class="form-control" type="text" id="modalBirthday" name="birthday"><br/><br/>
                        手机号 &nbsp;&nbsp;&nbsp;&nbsp; <input class="form-control" type="text" id="modalMobile" name="mobile"><br/><br/>
                        激活状态&nbsp;&nbsp;
                        <select id="modalStatus" name="status" class="form-control">
                            <option value="激活" selected>激活</option>
                            <option value="未激活">未激活</option>
                        </select>
                    </div>
                    </div>

            </div>
            <div class="modal-footer">
                <button id="modalFooter" type="submit" class="btn btn-default" data-dismiss="modal" />
                <button class="btn btn-default" data-dismiss="modal" class="modalClose">关闭</button>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</form>



















</body>
</html>