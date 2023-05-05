<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="impl.TrainDao" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>添加车次</title>
    </head>

    <body>
      <h2>&nbsp&nbsp添加车次</h2>
      <form action="Add.jsp" method="get">
        <table border=0 align="center" cellpadding="5px">
          <thead>
            <tr>
              <th>项目</th>
              <th>属性</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>车次号</th>
              <th><input type="text" name="Trainid"></th>
            </tr>
            <tr>
              <th>起点城市</th>
              <th><input type="text" name="Startcity"></th>
            </tr>
            <tr>
              <th>起点站</th>
              <th><input type="text" name="Start"></th>
            </tr>
            <tr>
              <th>终点城市</th>
              <th><input type="text" name="Endcity"></th>
            </tr>
            <tr>
              <th>终点站</th>
              <th><input type="text" name="End"></th>
            </tr>
            <tr>
              <th>出发时间</th>
              <th><input type="datetime-local" name="Starttime"></th>
            </tr>
            <tr>
              <th>到达时间</th>
              <th><input type="datetime-local" name="Endtime"></th>
            </tr>
            <tr>
              <th>座位类型</th>
              <th>
                <select name="Seatmode">
                  <option value="无座">无座</option>
                  <option value="硬座">硬座</option>
                  <option value="软卧">软卧</option>
                </select>
              </th>
            </tr>
            <tr>
              <th>票数量</th>
              <th><input type="text" name="Number"></th>
            </tr>
            <tr>
              <th>车厢号</th>
              <th><input type="text" name="Carriage"></th>
            </tr>
            <tr>
              <th>价格</th>
              <th><input type="text" name="Price"></th>
            </tr>
            <tr>
              <th><button type="reset">重置</button></th>
              <th><button type="submit">提交</button></th>
            </tr>
          </tbody>
        </table>
      </form>

    </body>

    </html>