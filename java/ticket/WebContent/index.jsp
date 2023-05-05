<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>客运首页</title>
    <link rel="icon" href="image/logo.ico" type="image/x-icon">
    <script type="text/javascript">
      var id = document.cookie.split(";")[0].split("=")[1];
    </script>
    <style type="text/css">
      * {
        margin: 0;
        padding: 0;
      }

      body {
        text-align: center;
        margin: 0;
        font: 14px Arial, Helvetica, sans-serif, "宋体";
        color: #4d4d4d;
      }

      a {
        text-decoration: none;
      }

      a:hover {
        text-decoration: underline;
      }

      ul {
        list-style: none;
        padding: 0;
        margin: 0;
      }

      li {
        margin: 6px 0;
      }

      a img {
        border: none;
      }

      h1 {
        font-size: 14px;
        color: #077ff0;
        font-weight: normal;
        border-bottom: 1px dashed #c4c4c4;
        padding-bottom: 10px;
        margin-bottom: 10px;
      }

      p {
        line-height: 30px;
        color: #565656;
        text-indent: 2em;
      }

      p a {
        color: #447fc5;
      }

      #wrap {
        width: 910px;
        margin: 0 auto;
        text-align: left;
        background-color: #FFFCEC;
      }

      #head {
        width: 100%;
        overflow: hidden;
        background-image: url(image/bjtp.gif);
        background-size: cover;
        height: 150px;
      }

      .logo {
        float: left;
        width: 270px;
        height: 100px;
      }

      .topnav {
        float: right;
        width: 28%;
        margin-top: 55px;
        font-size: 12px;
      }

      .topnav ul {
        overflow: hidden;
        width: 100%;
      }

      .topnav li {
        float: left;
        color: #dddddd;
      }

      .topnav li a {
        color: #ffffff;
      }

      .topnav li span {
        margin: 0 8px;
      }

      .nav {
        width: 910px;
        overflow: hidden;
        background-color: #2e72bb;
      }

      .nav ul {
        width: 100%;
        overflow: hidden;
        margin: 15px 0;
      }

      .nav li {
        float: left;
        margin: 0 30px;
        font-size: 14px;
      }

      .nav li a {
        color: #fff;
        font-weight: bold;
      }

      .nav li a:hover {
        color: #FFFF66;
        text-decoration: none;
      }

      .nav li.rss {
        float: right;
        margin: 0;
      }

      #container {
        width: 906px;
        overflow: hidden;
        position: relative;
        border-top: 1px solid #6495ED;
        border-right: 1px solid #6495ED;
        border-bottom: 1px solid #6495ED;
        border-left: 1px solid #6495ED;
        padding: 2px 1px;
        background: #fff;
      }

      #side {
        width: 170px;
        padding: 10px 0;
        position: absolute;
        top: 3px;
        left: 2px;
      }

      #side ul {
        width: 140px;
        margin: 0 auto;
      }

      #side li {
        line-height: 28px;
        font-weight: bold;
      }

      #side li a {
        color: #0082ee;
      }

      #content {
        width: 566px;
        padding: 20px 0;
        float: left;
        margin-left: 180px;
        border-left: 1px solid #ebebe9;
      }

      #right {
        width: 140px;
        padding: 10px 0;
        position: absolute;
        top: 3px;
        right: 2px;
        border-left: 1px solid #6495ED;
        border-bottom: 1px solid #6495ED;
      }

      #right ul {
        width: 140px;
        margin: 0 auto;
      }

      #right li {
        line-height: 28px;
        font-weight: bold;
      }

      #right li a {
        color: #0082ee;
      }


      #footer {
        width: 100%;
        overflow: hidden;
        text-align: center;
        font-size: 12px;
        color: #949494;
      }

      #footer ul {
        margin-top: 20px;
      }

      #footer li a {
        color: #949494;
        margin: 0 5px;
      }

      .p1 {
        list-style-image: url(image/a.png);
        list-style-position: inside
      }

      .p2 {
        list-style-image: url(image/b.png);
        list-style-position: inside
      }

      .p3 {
        list-style-image: url(image/c.png);
        list-style-position: inside
      }

      .p4 {
        list-style-image: url(image/d.png);
        list-style-position: inside
      }

      .p5 {
        list-style-image: url(image/e.png);
        list-style-position: inside
      }

      .p6 {
        list-style-image: url(image/f.png);
        list-style-position: inside
      }

      .1 {
        list-style-image: url(image/1.jpg);
        list-style-position: outside
      }
    </style>

    <script language=javascript>
      var curIndex = 0;
      //时间间隔(单位毫秒)，每秒钟显示一张，数组共有5张图片放在Photos文件夹下。
      var timeInterval = 2000;
      var arr = new Array();
      arr[0] = "image/1.jpg";
      arr[1] = "image/2.jpg";
      arr[2] = "image/3.jpg";
      arr[3] = "image/4.jpg";
      setInterval(changeImg, timeInterval);
      function changeImg() {
        var obj = document.getElementById("obj");
        if (curIndex == arr.length - 1) {
          curIndex = 0;
        }
        else {
          curIndex += 1;
        }
        obj.src = arr[curIndex];
      }
    </script>

  </head>

  <body>
    <div id="wrap">
      <div id="head">
        <div class="topnav">
          <ul>
            <li>欢迎您！</li>
            <li><a href="Login.jsp" id="user">登录</a><span>|</span></li>
            <script>
              if (id != null) {
                document.getElementById("user").href = "a.jsp";
                document.getElementById("user").innerHTML = id
              }
            </script>
            <li>
              <script>
                if (id != null) document.write("<a href='esc.jsp'>退出</a><span>|</span>");
              </script>
            </li>
            <li><a href="#">反馈建议</a><span>|</span></li>
            <li><a href="#">客服</a></li>
          </ul>
        </div>
        <div><img src="image/logo.png" width="280" height="110"></div>
      </div>
      <div class="nav">
        <ul>
          <li><a href="index.jsp">首页</a></li>
          <li><a href="Buy.jsp">客运服务</a></li>
          <li><a href="#">铁路畅行</a></li>
          <li><a href="#">车站引导</a></li>
          <li><a href="https://baike.so.com/doc/6788342-7004951.html">铁路常识</a></li>
          <li><a href="http://www.12306.cn/mormhweb/zcfc/">站车风采</a></li>
          <li><a href="#">客户信箱</a></li>

        </ul>
      </div>
      <div id="container">
        <div id="side">
          <ul>
            <li class="p1"><a href="Register.jsp" id="register">用户注册</a></li>
            <li class="p2"><a href="Buy.jsp">购票</a></li>
            <li class="p3"><a href="Myorder.jsp">退票</a></li>
            <li class="p4"><a href="yp.jsp">余票查询</a></li>
            <li class="p5"><a href="Traintime.jsp">时刻表查询</a></li>
            <li>
              <div><img id=obj src="image/1.jpg" width="140" height="150"></div>
            </li>
          </ul>
        </div>
        <div id="content">
          <h1>铁路互联网购票身份核验须知</h1>
          <p>“铁路互联网购票身份核验须知”指的是通过铁路12306网站购票时，购票身份验证的相关内容介绍。可进行购票的身份证明有：大陆人员身份证，护照，港澳居民来往内地通行证、台湾居民来往大陆通行证。</p>
          <p>为了进一步完善铁路实名制购票工作，自2014年3月1日起，中国铁路客户服务中心网站（以下简称本网站）将对互联网注册用户和常用联系人（乘车人）进行身份信息核验。</p>
          <p>注册用户可查看注册用户、常用联系人（乘车人）的身份信息核验状态（以下简称状态）。</p>
          <p>状态种类及含义：</p>
          <p>1.1 “已通过”：指注册用户、常用联系人（乘车人）的身份信息已经通过核验，其中姓名、证件类型和证件号码三项身份信息不可修改。 </p>
          <p>1.2 “待核验”：指注册用户、常用联系人（乘车人）的身份信息未经核验，需持二代居民身份证原件到车站售票窗口办理核验。</p>
          <p>1.3
            “未通过”：指注册用户、常用联系人（乘车人）的身份信息经过核验但未通过，需修改本网站所填写的身份信息内容与二代居民身份证原件完全一致，保存后状态显示“待核验”时，需持二代居民身份证原件到车站售票窗口或铁路客票代售点办理核验。
          </p>
        </div>
        <div id="right">
          <h1 align="center">推送信息栏</h1>
          <ul>
            <li>
              <div><img src="image/gg1.png" width="140"></div>
            </li>
          </ul>
        </div>
      </div>

      <div id="footer">
        <ul>
          <li><a href="#">关于网上铁路购票</a> | <a href="AdminLogin.jsp">Administrator Login</a> | <a href="#">服务条款</a> | <a
              href="#">广告服务</a> | <a href="#">客服招聘</a> | <a href="#">客服服务</a> | <a href="#">网站导航</a></li>
          <li>Copyright &copy; xxx xxx.All Rights Reserved.</li>
          <li><a href="#"><img src="image/logo.ico" width="20" height="20" /></a></li>
        </ul>
      </div>
    </div>
  </body>

  </html>