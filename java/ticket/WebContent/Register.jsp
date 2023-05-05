<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>铁路购票系统-用户注册</title>

        <link rel="icon" href="image/tb.ico" type="image/x-icon">
        <style>
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

            #a {
                font-family: 黑体;
                border-style: solid;
                border-top: 2px solid #4169E1;
                border-bottom: 2px solid #4169E1;
                border-left: 2px solid #4169E1;
                border-right: 2px solid #4169E1;
                height: 500px;
                width: 800px;
                margin: 0 auto;
            }

            #b {
                margin: 0px;
                background-image: url(image/bj3.png);
                background-size: cover;
                height: 50px;
                width: 804px;
                margin: 0 auto;
            }

            #c {
                color: white;
                float: left;
            }

            .topnav {
                float: right;
                width: 40%;
                font-size: 12px;
            }

            .topnav a {
                color: #2e7ec7;
            }

            .topnav span {
                margin: 0 8px;
            }

            a:link,
            a:visited {
                text-decoration: none;
                /*超链接无下划线*/
            }

            a:hover {
                text-decoration: underline;
                /*鼠标放上去有下划线*/
            }
        </style>
    </head>

    <body>
        <div id="wrap">
            <div id="head">
                <div>
                    <h2><img src="image/logo.png" width="280" height="100px"></h2>
                </div>
                <div class="topnav">
                    <a href="index.jsp">客运首页</a><span>|<a href="train.jsp">车票预定</a>
                </div>
            </div>
            <div>
                <div>
                    <h4>您现在的位置：<a href="index.jsp">客运首页</a>>注册</h4>
                    <hr />
                    <div id="b">
                        <h4 id="c">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp账户信息</h4>
                    </div>
                    <div id="a">
                        <br />
                        <form action="Registering.jsp" method="get">
                            &nbsp&nbsp*&nbsp用&nbsp户&nbsp名：<input type="text"
                                name="Id">&nbsp6-30位字母、数字或"-",字母开头<br /><br />
                            &nbsp&nbsp*&nbsp登录密码：<input type="password" name="Password"><br /><br />
                            &nbsp&nbsp*&nbsp确认密码：<input type="password" name="Password"><br /><br />
                            &nbsp&nbsp*&nbsp姓&nbsp&nbsp&nbsp&nbsp名：<input type="text" name="Name"><br /><br />
                            &nbsp&nbsp*&nbsp证件类型：<select>
                                <option value="1">第二代身份证</option>
                                <option value="2">护照</option>
                                <option value="3">港澳通行证</option>
                            </select><br /><br />
                            &nbsp&nbsp*&nbsp证件号码：<input type="text" name="Id1"><br /><br />
                            &nbsp&nbsp*&nbsp手机号码：<input type="text" name="Phone"
                                style="color: #FF7F00;">&nbsp请正确填写手机号码，稍后将向该手机号码发送短信验证码<br /><br />
                            &nbsp&nbsp*&nbsp游客类型：<select>
                                <option value="1">成人</option>
                                <option value="2">学生</option>
                                <option value="3">儿童</option>
                            </select>
                            <br /><br />
                            <div align="center">
                                <input type="radio">我已阅读并同意<br /><br />
                                <div><a href="http://www.360doc.com/content/13/0727/13/3325844_302813958.shtml"
                                        class="ft14" target="_blank" shape="rect">《中国铁路客户服务中心网站服务条款》</a></div>
                                </br><button type="submit" style="background:#eeeeee">注册</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>