<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="contentWrap">
	<h2 class="bigTitle">판매관리</h2>
	<table class="adminList table6">
		<thead>
			<tr>
				<th>관리번호</th>
				<th>주문번호</th>
				<th>제품번호</th>
				<th>제품명</th>
				<th>수량</th>
				<th>가격</th>
				<th>이름</th>
				<th>연락처</th>
				<th>아이디</th>				
				<th>주문일</th>
				<th>주문상태</th>
				<th>배송관리</th>
			</tr>
		</thead>
		<c:forEach var="order" items="${orderList }">
			<tr>
				<td>${order.o_no }</td>
				<td class="ordernum"><a href="/admin/order/${order.ordernum}">${order.ordernum }</a></td>
				<td>${order.pronum }</td>
				<td><a href="/product/${order.pronum}">${order.proname }</a></td>
				<td>${order.quantity }</td>
				<td>${order.price }</td>
				<td>${order.name }</td>
				<td>${order.phone}</td>
				<td>${order.id }</td>	
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${order.order_date }"></fmt:formatDate></td>
				<td>${order.process }</td>
				<td><button class="modify">배송</button> <button class="delete">취소</button></td>		
			</tr>
		</c:forEach>
	</table>
</div>
<!-- Modal -->
 <div class="modal fade hidden" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 	<div class="modal-dialog">
 	  <div class="modal-content medium-modal">
 		<div class="modal-header">
 		  <h4 class="modal-title" id="myModalLabel">배송 관리</h4>
 		</div>
 		<div class="modal-body">
 		 <form class="salesForm" action="/admin/sales" method="post">
 		  <label class="delivery">택배사 <input name="delivery"></label>
 		  <label class="trackingNum">운송장 번호 <input name="trackingNum"></label>
 		  <label class="reason">주문 취소 사유 <input name="reason"></label>
 		  <input type="hidden" name="ordernum">
 		  <input type="hidden" name="process">
 		 </form>
 		</div> 		
 		<div class="modal-footer">
 			<button id="modalRegBtn" type="button" class="btn black">작성하기</button>
 			<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
 		</div>	
 	  </div>
 	</div> 		  
 </div>
<!-- Modal 끝 -->
<script type="text/javascript">
$(document).ready(function(){
	var modal = $("#myModal");
	var closeBtn = $("#modalCloseBtn");
	
	closeBtn.on("click",function(){
		modal.find("input").val("");
		modal.addClass("hidden");
		$("body").removeClass("fix");
	})
	
	$(".adminList button").on("click",function(e){
		var ordernum = $(this).parent().siblings(".ordernum").text();
		$("input[name=ordernum]").val(ordernum)
		
		if($(this).hasClass("modify")){
			$(".reason").addClass("hidden");
			$(".delivery").removeClass("hidden");
			$(".trackingNum").removeClass("hidden");
			$("input[name=process]").val("배송중");
		}else if($(this).hasClass("delete")){
			$(".reason").removeClass("hidden");
			$(".delivery").addClass("hidden");
			$(".trackingNum").addClass("hidden");
			$("input[name=process]").val("주문 취소");
		}
		
		
		modal.removeClass("hidden");
		$("body").addClass("fix");				
	});	
	
	$("#modalRegBtn").on("click",function(){
		$(".salesForm").submit();
	})
	
	if("${result}"=="success"){
		alert("정상적으로 처리되었습니다.");
	}
})
</script>

<%@ include file="../includes/footer.jsp" %>