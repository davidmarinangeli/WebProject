<%-- 
    Document   : notification
    Created on : 18-gen-2017, 0.39.15
    Author     : Marco
--%>


<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <jsp:include page="header/headerFiles.jsp"/>
 <link rel="stylesheet" href="css/generic.css">
 

<!DOCTYPE html>

        <!-- header -->
            <ul class="nav nav-tabs" style="display: inline">
                 <li class="active"><a data-toggle="tab" href="#home"><h3><strong>Replies To Confirm</strong> <span class="badge">${fn:length(noty.replies)}</span></h3></a></li>
                 <li><a data-toggle="tab" href="#menu1"><h3><strong>Change owner Request </strong><span class="badge">${fn:length(noty.chowner)}</span></h3></a></li>
                 <li><a data-toggle="tab" href="#menu2"><h3><strong>Delete Photo Request </strong><span class="badge">${fn:length(noty.delphotos)}</span></h3></a></li>
                 <li><a data-toggle="tab" href="#menu4"><h3><strong>Restaurant Notification </strong><span class="badge">0</span></h3></a></li>
                 <li><a data-toggle="tab" href="#menu5"><h3><strong>Restaurant Notification Viewed</strong><span class="badge">0</span></h3></a></li>
                 <li><a data-toggle="tab" href="#menu3"><h3><strong>Notification Accepted </strong></h3></a></li>
            </ul>
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <p>
                        <c:if test="${fn:length(noty.replies) gt 0}">
                            <c:forEach var="notbean" items="${noty.replies}">
                                <c:if test="${notbean.accepted == false}">
                                    <div class="list-group">
                                        <c:url value="showreplyconfirm.jsp" var="repliesURL">
                                             <c:param name="id" value="${notbean.idrep}" />
                                        </c:url>
                                        <a href="${repliesURL}" class="list-group-item">
                                            <strong><c:out value="${notbean.ristoratore}"/></strong>
                                            Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                        </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                         <c:if test="${empty noty.replies}">
                            <h1> Per ora non ci sono notifiche, torna pi� tardi</h1>
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
                                     </a>
                                   </div>
                                </c:if>
                           </c:forEach>
                         </c:if>
                        <c:if test="${empty noty.chowner}">
                            <h1> Per ora non ci sono notifiche, torna pi� tardi</h1>
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
                             <h1> Per ora non ci sono notifiche, torna pi� tardi</h1>
                         </c:if>
                    <p>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <p>
                         <c:forEach var="notbean" items="${noty.replies}">
                                <c:if test="${notbean.accepted == true}">
                                    <div class="list-group">
                                        <c:url value="showreplyconfirm.jsp" var="repliesURL">
                                             <c:param name="id" value="${notbean.idrep}" />
                                        </c:url>
                                        <a href="${repliesURL}" class="list-group-item">
                                            <strong><c:out value="${notbean.ristoratore}"/></strong>
                                            Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                        </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        <c:forEach var="notbean" items="${noty.chowner}">
                            <c:if test="${notbean.accepted == true}">
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        <strong><c:out value="${notbean.ristoratore}"/></strong>
                                        Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="notbean" items="${noty.delphotos}">
                            <c:if test="${notbean.accepted == true}">
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        <strong><c:out value="${notbean.ristoratore}"/></strong>
                                        Ha risposto ad un commento di <strong><c:out value="${notbean.customer}"/></strong> sul proprio ristorante.
                                    </a>
                                </div>
                            </c:if>
                        </c:forEach>
                    <p>
                </div>
                
                <div id="menu4" class="tab-pane fade">
                    <p>
                          <c:if test="${fn:length(resnoty.review_list) gt 0}">  
                           <c:forEach var="notbean" items="${resnoty.review_list}">
                                <c:if test="${notbean.view == false}">
                                    <c:url value="UpdateReviewServlet" var="reviewURL">
                                        <c:param name="id" value="${notbean.id}" />
                                    </c:url>
                                    <div class="list-group">
                                     <a href="${reviewURL}" class="list-group-item">
                                           <strong><c:out value="${notbean.nickname}"/></strong>
                                           ha scritto una recensione sul tuo ristorante.
                                     </a>
                                   </div>
                                </c:if>
                           </c:forEach>
                         </c:if>
                        <c:if test="${empty resnoty.review_list}">
                            <h1> Per ora non ci sono notifiche, torna pi� tardi</h1>
                        </c:if>
                     </p>
                </div>
                
                <div id="menu5" class="tab-pane fade">
                    <p>
                          <c:if test="${fn:length(resnoty.review_list) gt 0}">  
                           <c:forEach var="notbean" items="${resnoty.review_list}">
                                <c:if test="${notbean.view == true}">
                                    <c:url value="showreview.jsp" var="reviewURL">
                                        <c:param name="id" value="${notbean.id}" />
                                    </c:url>
                                    <div class="list-group">
                                     <a href="${reviewURL}" class="list-group-item">
                                           <strong><c:out value="${notbean.nickname}"/></strong>
                                           ha scritto una recensione sul tuo ristorante.
                                     </a>
                                   </div>
                                </c:if>
                           </c:forEach>
                         </c:if>
                        <c:if test="${empty resnoty.review_list}">
                            <h1> Per ora non ci sono notifiche, torna pi� tardi</h1>
                        </c:if>
                     </p>
                </div>
                
              </div>
              <div class="navbar">
                <!--footer-->
                <footer>
                    <hr>
                    <p>Realizzato da Mirko, Nicola, David, Marco e Riccardo.</p>
                </footer>
            </div>