<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <title>数码在线回收-个人中心</title>
        <style>
            body {
                background-attachment: fixed;
                background-image: url(/image/SignLogBG.jpg);
                background-repeat: no-repeat;
                background-size: 100% 100%;
            }
            
            #Profle {
                position: absolute;
                text-align: center;
                left: 50%;
                transform: translate(-50%);
            }
            
            #ProfleIMG {
                width: 96px;
                height: 96px;
            }
            
            #UserInfo {
                background-color: rgba(0, 0, 0, 0.8);
                border-radius: 20px;
                padding: 20px;
                padding-left: 40px;
                width: 30%;
                height: 150px;
                position: absolute;
                left: 50%;
                top: 180px;
                transform: translate(-50%);
            }
            
            h3 {
                color: aliceblue;
            }
            
            #Orderform {
                background-color: rgba(0, 0, 0, 0.8);
                border-radius: 20px;
                margin-bottom: 20px;
                padding: 20px;
                padding-left: 40px;
                width: 50%;
                height: auto;
                position: absolute;
                left: 50%;
                top: 400px;
                transform: translate(-50%);
            }
            
            table {
                color: azure;
            }
            
            th {
                padding-left: 10px;
                padding-right: 10px;
            }
            
            td {
                padding-left: 10px;
                padding-right: 10px;
            }
            
        </style>
    </head>

    <body>
        <div id="Profle">
            <img id="ProfleIMG" src="/img/profle.png" />
            <h3> ${user.username} </h3>
        </div>
        
        <div id="UserInfo">
            <div>
                <h3 style="display: inline"> 个人信息 </h3>
                <a href="/rest/page/EditInfo"> <img id="EditICON" src="/img/EditIcon.png" /> </a>
            </div>
            
            <div style="margin-top: 20px">
                <table>
                    <tr>
                        <td> <img src="/img/Tel.png" /> </td>
                        <td> <strong> Tel： </strong> </td>
                        <td> <strong> ${user.phone} </strong> </td>
                    </tr>
                    
                    <tr>
                        <td> <img src="/img/EMail.png" /> </td>
                        <td> <strong>Email： </strong> </td>
                        <td> <strong> ${user.email} </strong> </td>
                    </tr>

                    <tr>
                        <td> <img src="/img/Address.png" /> </td>
                        <td> <strong> Address： </strong> </td>
                        <td> <strong>  </strong> </td>
                    </tr>
                
                </table>
            </div>
        </div>
        
        <div id="Orderform">
            <div>
                <h3> 我的订单 </h3>
            </div>
            
            <div>
                <table align="center" cellpadding="10">
                    <tr>
                        <th> </th>
                        <th> 商品 </th>
                        <th> 交易单号 </th>
                        <th> 回收价 </th>
                        <th> 交易时间 </th>
                        <th> 订单状态 </th>
                    </tr>

                        <c:forEach items="${orders}" var="order">
                            <tr>
                                <td> <img style="width: 50px; height: 50px" src="${order.item_image}" /> </td>
                                <td>${order.item_name} </td>
                                <td>${order.order_id} </td>
                                <td>￥${order.item_recycle_price}</td>
                                <td>${order.created}</td>
                                <td >${order.status}</td>
                            </tr>
                        </c:forEach>

                </table>
            </div>
        </div>
    </body>
</html>