<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
  
<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify / Delete</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Board Modify / Delete</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <form>
                                        <div class="form-group">
                                            <label>Bno</label><input class="form-control" name='bno'
                                            value='<c:out value="${board.bno}"/>' readonly="readonly">
                                        </div>                  
                                        <div class="form-group">
                                            <label>Title</label><input class="form-control" name='title'
                                            value='<c:out value="${board.title}"/>'>
                                        </div>                  
                                        <div class="form-group">
                                            <label>Text area</label>
                                            <textarea class="form-control" rows="3" name='content'>
                                            <c:out value="${board.content}"/></textarea>
                                        </div>                  
                                        <div class="form-group">
                                            <label>Writer</label><input class="form-control" name='writer'
                                            value='<c:out value="${board.writer}"/>' readonly="readonly">
                                        </div>
                                        <div class="form-group">
                                            <label>RegDate</label>
                                            <input class="form-control" name='regDate'
                                              value='<fmt:formatDate pattern = "yyyy/MM/dd" 
                                              value="${board.regdate}"/>' readonly="readonly">
                                        </div>
                                        <div class="form-group">
                                            <label>Update Date</label>
                                            <input class="form-control" name='updateDate'
                                              value='<fmt:formatDate pattern = "yyyy/MM/dd" 
                                              value="${board.updateDate}"/>' readonly="readonly">
                                        </div>
                                        
                                        <button type="submit" data-oper ='modify'
                                            class="btn btn-default">Modify</button>
                                             
                                        <button type="submit" data-oper ='remove'
                                            class="btn btn-danger">Remove</button>
                                             
                                        <button type="submit" data-oper ='list'
                                            class="btn btn-info">List</button> 
                                         	 
           	            </form>  
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <!-- /.row -->
            
<script type="text/javascript">
$(document).ready(function(){

	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		
		e.preventDefault();  //기본 기능을 중지
		
		 var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'list'){
			formObj.attr("action", "/board/list")
			       .attr("method", "get");
			formObj.empty();      
		}else if(operation === 'remove'){
			formObj.attr("action", "/board/remove")
			.attr("method", "post");
		}else if(operation === 'modify'){
			formObj.attr("action", "/board/modify")
			.attr("method", "post");
		}
		
		formObj.submit();	
		
	});	
});
</script>            

<%@include file="../includes/footer.jsp" %>        
