
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
      .fullscreen_bg {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-size: cover;
    background-position: 50% 50%;
    background-image: url('https://cleancanvas.herokuapp.com/img/backgrounds/color-splash.jpg');
    background-repeat:repeat;
  }
</style>
 
     <div id="fullscreen_bg" class="fullscreen_bg"/>
    <div class="container">   
    
    
   <c:if test="${editmode}">
      <c:set var="url" value="upadatecategory">
      </c:set>
    </c:if>
    
    <c:if test="${editmode}">
       <c:set var="url" value="addCategory"></c:set>
    </c:if>
    
    <c:if test="${haserror}">
    
    <div class="alert alert-danger alert-dismissable">
    <strong> oh snap!</strong> "${error}"   
    </div>
    </c:if>
    
    
	
    
  <div id="signupbox" style=" margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title"> &nbsp Category </div>
                           <!-- <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" ">Sign In</a></div>
                        </div> --> 
                        <div class="panel-body" >  
                            <form id="signupform" class="form-horizontal" role="form">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>  
                                    
                                
                                  
                       
                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">CategoryName</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="firstname" placeholder="Enter categoryname">
                                    </div>
                                </div>
                  
                  
                           <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">CategoryDesc</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="email" placeholder="Enter categorydesc
										">
                                    </div>
                                </div>
                                    
                           
                                <div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <button id="btn-signup" type="button" class="btn btn-info btn-block"><i class="icon-hand-right"></i> &nbsp Add Category</button>
                                       
                                    </div>
                                </div>                                                                                                       
                            </form>
                         </div>
                    </div>        
              </div> 