<%-- 
    Document   : notification
    Created on : 18-gen-2017, 0.39.15
    Author     : Marco
--%>

<%@page import="beans.NotificationRepliesBean"%>
<%@page import="beans.NotificationBean"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/generic.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- header -->
        <div class="container-fluid" >
           <div class="panel panel-default">
                <div class="panel-body">
                    <h2> Benvenuto <strong><c:out value="${user.nickname}"></c:out></strong> </h2>
                </div>
              </div>
            <ul class="nav nav-tabs" style="display: inline">
                 <li class="active"><a data-toggle="tab" href="#home"><h3><strong>Replies To Confirm</strong> <span class="badge">${fn:length(noty.replies)}</span></h3></a></li>
                 <li><a data-toggle="tab" href="#menu1"><h3><strong>Change owner Request </strong><span class="badge">${fn:length(noty.chowner)}</span></h3></a></li>
                 <li><a data-toggle="tab" href="#menu2"><h3><strong>Delete Photo Request </strong><span class="badge">${fn:length(noty.delphotos)}</span></h3></a></li>
                 <li><a data-toggle="tab" href="#menu3"><h3><strong>Notification Accepted </strong></h3></a></li>
            </ul>
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <p>
                        <c:if test="${fn:length(noty.replies) gt 0}">
                            <c:forEach var="notbean" items="${noty.replies}">
                                <c:if test="${notbean.accepted == false}">
                                    <div class="list-group">
                                        <a href="showreplyconfirm.jsp?notbean=${notbean.idrep}" class="list-group-item">
                                            <strong><c:out value="${notbean.ristoratore}"/></strong>
                                            Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                        </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                         <c:if test="${empty noty.replies}">
                            <h1> Per ora non ci sono notifiche, torna più tardi</h1>
                         </c:if>
                    </p>
                </div>
                <div id="menu1" class="tab-pane fade">
                    <p>
                        <c:if test="${fn:length(noty.chowner) gt 0}">   
                           <c:forEach var="notbean" items="${noty.chowner}">
                                <c:if test="${notbean.accepted == false}">
                                    <div class="list-group">
                                     <a href="#" class="list-group-item">
                                           <strong><c:out value="${notbean.nickname}"/></strong>
                                           ha richiesto di diventare il proprietario di <strong><c:out value="${notbean.resname}"/></strong>.
                                           <button type="button" class="btn btn-lg" aria-label="Left Align" style="float:right" value="Decline"></button>
                                     </a>
                                   </div>
                                </c:if>
                           </c:forEach>
                         </c:if>
                        <c:if test="${empty noty.chowner}">
                            <h1> Per ora non ci sono notifiche, torna più tardi</h1>
                        </c:if>
                     </p>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <p>
                        <c:if test="${fn:length(noty.delphotos) gt 0}">
                          <c:forEach var="notbean" items="${noty.delphotos}">
                                <c:if test="${notbean.accepted == false}">
                                    <div class="list-group">
                                     <a href="#" class="list-group-item">
                                           <strong><c:out value="${notbean.ristoratore}"/></strong>
                                           Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                     </a>
                                    </div>
                                </c:if>
                          </c:forEach>
                         </c:if>
                         <c:if test="${empty noty.delphotos}">
                             <h1> Per ora non ci sono notifiche, torna più tardi</h1>
                         </c:if>
                    <p>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <p>
                        <c:set var="n_replies" value="0"></c:set>
                        <c:forEach var="notbean" items="${noty.replies}">
                            <c:if test="${notbean.accepted == true}">
                                <c:set target="n_replies" value="1"></c:set>
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        <strong><c:out value="${notbean.ristoratore}"/></strong>
                                        Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:set var="n_chowner" value="0"></c:set>
                        <c:forEach var="notbean" items="${noty.chowner}">
                            <c:if test="${notbean.accepted == true}">
                                <c:set target="n_chowner" value="1"></c:set>
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        <strong><c:out value="${notbean.ristoratore}"/></strong>
                                        Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:set var="count_delphotos" value="0"></c:set>
                        <c:forEach var="notbean" items="${noty.delphotos}">
                            <c:if test="${notbean.accepted == true}">
                                <c:set target="count_delphotos" value="1"></c:set>
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        <strong><c:out value="${notbean.ristoratore}"/></strong>
                                        Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${count_delphotos == 0 && n_replies ==0 && n_chowner ==0}">
                             <h1> Per ora non ci sono notifiche, torna più tardi</h1>
                        </c:if>
 
                    <p>
                </div>
              </div>
              <div class="navbar">
                <!--footer-->
                <footer>
                    <hr>
                    <p>Realizzato da Mirko, Nicola, David, Marco e Riccardo.</p>
                </footer>
            </div>
        </div>
             
    </body>
</html>
