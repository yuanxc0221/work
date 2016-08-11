<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <title>Pizza - free responsive website template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <!--
    Pizza Template
    http://www.cssmoban.com/preview/templatemo_459_pizza
    -->

    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/lib/pagers/css/style.css" media="screen"/>
    <!-- bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/front-end/css/bootstrap.min.css">
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/front-end/css/font-awesome.min.css">
    <!-- custom -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/front-end/css/templatemo-style.css">
    <!-- google font -->
    <link href='http://fonts.useso.com/css?family=Signika:400,300,600,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Chewy' rel='stylesheet' type='text/css'>

</head>
<body id="home" data-spy="scroll" data-target=".navbar-collapse">

<!--模态框-->
<div class="modal fade" id="details" tabindex="-1" role="dialog" aria-labelledby="passSelectLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="passSelectLabel">面试结果查询</h4>
            </div>
            <div class="modal-body">
                <form id="modal-form" action="#">
                    <div class="form-group">
                        <label for="modal_name" class="control-label">姓名:</label>
                        <input type="text" class="form-control" id="modal_name" name="name">
                    </div>
                    <div class="form-group">
                        <label for="modal_phone" class="control-label">手机号码:</label>
                        <input class="form-control" id="modal_phone" name="phoneNumber">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button id="modal_submit" type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--模态框-->

<!-- start navigation -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon icon-bar"></span>
                <span class="icon icon-bar"></span>
                <span class="icon icon-bar"></span>
            </button>
            <a href="#home" class="navbar-brand smoothScroll"><strong>PIZZA</strong></a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">

                <li><a href="#home" class="smoothScroll">主页</a></li>
                <li><a href="#about" class="smoothScroll">关于我们</a></li>
                <li><a href="#gallery" class="smoothScroll">商品</a></li>
                <li><a href="#contact" class="smoothScroll">意见反馈</a></li>
                <c:if test="${loginUser.u_id != null}">
                    <li><a href="#" data-toggle="dropdown" class="dropdown dropdown-toggle" >${loginUser.name}，你好<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">
                                <i class="icon-user"></i>我的账户</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/user/user/logout">
                                <i class="icon-user"></i>注销</a>
                            </li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${loginUser.u_id == null}">
                    <li><a href="${pageContext.request.contextPath}/loginUI.jsp">登录</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
<!-- end navigation -->

<!-- start flexslider -->
<div class="flexslider">
    <ul class="slides">
        <li>
            <img src="${pageContext.request.contextPath}/resources/front-end/images/slider-img1.jpg" alt="Pizza Image 1">
            <div class="flex-caption">
                <h2 class="slider-title">We make Pizza</h2>
                <h3 class="slider-subtitle">新鲜的, 干净的, 美味的.</h3>
            </div>
        </li>
        <li>
            <img src="${pageContext.request.contextPath}/resources/front-end/images/slider-img2.jpg" alt="Pizza Image 2">
            <div class="flex-caption">
                <h2 class="slider-title">Freshly Baked Pizza</h2>
                <h3 class="slider-subtitle">优质的,最好的</h3>
            </div>
        </li>
    </ul>
</div>
<!-- end flexslider -->

<!-- start about -->
<section id="about" class="templatemo-section templatemo-top-130">
    <div class="container">
        <div class="row">

            <div class="col-md-6 col-sm-6">
                <h3 class="text-uppercase padding-bottom-10">About us</h3>
                <p>　　我们的美味比萨有数十种之多，而等待一份比萨新鲜出炉的时间永远不会超过15分钟，并且你在各地的Pizza，品尝到的比萨口味都完全一致。作为世界的比萨连锁品牌，我们是如何做到又新鲜，又快速，又好吃的呢？这主要得益于四大因素：
                    1 完全现场制作　　2 新鲜的蔬菜　　3 上等的馅料　　4 标准化的制作流程.<br>
                    　　也许很多人在品尝着我们的美食时都会以为，在我们的厨房里，一定有一批技艺精湛、个性各异的厨师。事实上，我们的“厨师”的确是技艺精湛，但却不能有丝毫个性发挥。因为，我们强调的是标准化，每一道工序，必须严格按照操作流程进行，
                    不得有丝毫疏漏——只有如此才能保证每一种产品口味的纯正和统一。我们的每个产品都有一本厚厚的制作手册，其细致和严格，令人叹
                    为观止。比如说制作比萨饼，工序是最为复杂的。和面的份量、时间和温度，面饼的制作规格和方法，面饼的发酵温度和时间，馅料的份量
                    和比例，烘烤的温度和时间……标准无处不在，简直是在生产一种精密仪器。其它食品也是如此。汤类，用配好的汤料按标准熬煮而成；鸡翅
                    、串烤等小吃，需按标准的方法腌制，进烤箱烘烤标准的时间才可以上桌；蛋糕、冰淇淋等是成品，只需简单的加工就可直接装盘；至于沙拉
                    ，是由配送中心洗净、切好的成品，直接放在沙拉吧上。不仅是食品，我们的各种餐具的摆放，食品上桌的次序，服务的语言和方式均有严格的
                    标准，令顾客感到无微不至。</p>
            </div>
            <div class="col-md-6 col-sm-6">
                <img src="${pageContext.request.contextPath}/resources/front-end/images/about-img1.jpg" class="img-responsive img-bordered img-about" alt="about img">
            </div>
        </div>
    </div>
</section>
<!-- end about -->
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >手机网站模板</a></div>

<!-- start gallery -->
<section id="gallery" class="templatemo-section templatemo-light-gray-bg">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center text-uppercase">商品列表</h2>
                <hr>
            </div>
            <div id="goods_show">
                <!--商品列表-->
            </div>
            <span class="pagers">
                <div id="pagers" style="width: 480px">
                    <!--分页插件显示-->
                </div>
            </span>
        </div>
    </div>
</section>

<!-- end gallery -->

<!-- start contact -->
<section id="contact" class="templatemo-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-uppercase text-center">意见反馈</h2>
                <hr>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <form action="#" method="post" role="form">
                    <div class="col-md-6 col-sm-6">
                        <input name="name" type="text" class="form-control" id="name" maxlength="60" placeholder="姓名">
                        <input name="phone" type="email" class="form-control" id="email" placeholder="电话号码">
                        <input name="address" type="text" class="form-control" id="message" placeholder="地址">
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <textarea name="message" class="form-control" rows="5" placeholder="建议"></textarea>
                    </div>
                    <div class="col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6">
                        <input name="submit" type="submit" class="form-control" id="submit" value="提交">
                    </div>
                </form>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-4 col-sm-4">
                <h3 class="padding-bottom-10 text-uppercase">联系方式</h3>
                <p><i class="fa fa-map-marker contact-fa"></i>东软Pizza</p>
                <p>
                    <i class="fa fa-phone contact-fa"></i>
                    <a href="tel:010-020-0340" class="contact-link">13621410597</a>
                </p>
                <p><i class="fa fa-envelope-o contact-fa"></i>
                    <a href="mailto:hello@company.com" class="contact-link">739769483@qq.com</a></p>
            </div>
            <div class="col-md-4 col-sm-4">
                <h3 class="text-uppercase">配送时间</h3>
                <p><i class="fa fa-clock-o contact-fa"></i> 7:00 AM - 11:00 PM</p>
                <p><i class="fa fa-bell-o contact-fa"></i> 周一至周六</p>
            </div>
            <div class="col-md-4 col-sm-4">
                <div class="google_map">

                </div>
            </div>
        </div>
    </div>
</section>
<!-- end contact -->

<!-- start footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p>Copyright &copy; 2084 Company Name</p>
                <hr>
                <ul class="social-icon">
                    <li><a href="#" class="fa fa-facebook"></a></li>
                    <li><a href="#" class="fa fa-twitter"></a></li>
                    <li><a href="#" class="fa fa-instagram"></a></li>
                    <li><a href="#" class="fa fa-pinterest"></a></li>
                    <li><a href="#" class="fa fa-google"></a></li>
                    <li><a href="#" class="fa fa-github"></a></li>
                    <li><a href="#" class="fa fa-apple"></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<!-- end footer -->
<script src="${pageContext.request.contextPath}/resources/front-end/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/front-end/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/front-end/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/resources/front-end/js/smoothscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/front-end/js/custom.js"></script>
<!--分頁插件-->
<script src="${pageContext.request.contextPath}/resources/lib/pagers/jquery.paginate.js" type="text/javascript"></script>

<script>
    $(document).ready(function(){
        $.ajax({
            url : "${pageContext.request.contextPath}/indexPagers",
            type : 'get',
            cache: false,
            dataType : 'json',
            async : false,
            success : function(data) {
                $("#pagers").paginate({
                    count 		: data,
                    start 		: 1,
                    display     : 3,
                    border		: true,
                    border_color: "#79B5E3",//边框的颜色
                    text_color  			: '#79B5E3',//页码文字的颜色
                    background_color    	: '#FFFFFF',//页码容器的背景颜色
                    text_hover_color  		: '#2573AF',//当鼠标移动到页码上时，页码文字的颜色
                    background_hover_color	: '#AAE',//当鼠标移动到页码上时，容器的背景颜色
                    border_hover_color: "#AAE",//当鼠标移动到页码上时，容器的边框颜色
                    images		: false,
                    mouse		: 'press',
                    onChange    : function(page){ //本插件唯一可触发的事件,在点击页数的时候触发,只传过来当前被选中的页数,我想这其实足够了.
                        list(page);
                    }
                });
                list(0);
            },
            error : function() {
                return;
            }
        });

    });


    function list(pages) {
        $.ajax({
            url : "${pageContext.request.contextPath}/paging/" + pages ,
            type : 'get',
            cache: false,
            dataType : 'json',
            async : false,
            success : function(data) {
                $("#goods_show").empty();
                jQuery.each(data, function(i,item){
                    //alert(item.g_id+","+item.name + "" +i+" " + item.picture +" "+ item.goods_type.gt_name +"------");
                    $("#goods_show").append("<div class=col-md-4 col-sm-4><div class=gallery-wrapper ><a href=${pageContext.request.contextPath}/detail/"+item.g_id+" id=goods_list"+i+"></a></div></div>")
                    if(item.picture==null){
                        $("#goods_list"+i).append("<img alt="+item.name+" class=img-responsive gallery-img src="+"${pageContext.request.contextPath}/resources/admin/images/miss.PNG>")
                    }else{
                        $("#goods_list"+i).append("<img alt="+item.name+" class=img-responsive gallery-img src="+"${pageContext.request.contextPath}/resources/file/goods/"+item.picture+">")
                    }
                    $("#goods_list"+i).append("<div class=gallery-des><h3>"+item.name+"<h3><h4>￥"+item.money+"</h4></div>")
                });
            },
            error : function() {
                return;
            }
        });
    };
</script>
a
<c:if test="${result!=null}">
    <script>
        $(document).ready(function(){               //当 DOM（文档对象模型） 已经加载，并且页面（包括图像）已经完全呈现时，会发生 ready 事件。
            var success=${result.success};   //    由于该事件在文档就绪后发生，因此把所有其他的 jQuery 事件和函数置于该事件中是非常好的做法。正如上面的例子中那样。
            var msg='${result.msg}';        //ready() 函数规定当 ready 事件发生时执行的代码。
            var type="error";               //ready() 函数仅能用于当前文档，因此无需选择器。
            if(success=true){
                type="success"
            }
            $._messengerDefaults = {
                extraClasses: 'messenger-fixed messenger-theme-air  messenger-on-top messenger-on-right'
            }
            $.globalMessenger().post({  message:"提示："+ msg,
                type: type,
                showCloseButton: true})
        })
    </script>
</c:if>
</body>
</html>