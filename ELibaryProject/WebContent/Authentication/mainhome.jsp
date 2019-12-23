<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
     
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <title>Electonicus-Bibliotheca Home</title>

     <link rel="stylesheet" type="text/css" href="../includes/css/homepage.css">
<style type="text/css">
	
	.jumbotron{
    background: rgba(0,0,0,.8);
    text-align:center;
}

</style>

</head>
<body style="padding:0px; margin:0px; font-family:arial,helvetica,sans-serif,verdana,'Open Sans'">

    <!-- #region Jssor Slider Begin -->
    <!-- Generator: Jssor Slider Composer -->
    <!-- Source: https://www.jssor.com/demos/banner-slider.slider/=edit -->
    <script src="../includes/js/jssor.slider-28.0.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        window.jssor_1_slider_init = function() {

            var jssor_1_SlideshowTransitions = [
              {$Duration:800,x:-0.3,$During:{$Left:[0.3,0.7]},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:0.3,$SlideOut:true,$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2}
            ];

            var jssor_1_options = {
              $AutoPlay: 1,
              $SlideshowOptions: {
                $Class: $JssorSlideshowRunner$,
                $Transitions: jssor_1_SlideshowTransitions,
                $TransitionsOrder: 1
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$,
                $Orientation: 2,
                $NoDrag: true
              }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*#region responsive code begin*/

            var MAX_WIDTH = 980;

            function ScaleSlider() {
                var containerElement = jssor_1_slider.$Elmt.parentNode;
                var containerWidth = containerElement.clientWidth;

                if (containerWidth) {

                    var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                    jssor_1_slider.$ScaleWidth(expectedWidth);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }

            ScaleSlider();

            $Jssor$.$AddEvent(window, "load", ScaleSlider);
            $Jssor$.$AddEvent(window, "resize", ScaleSlider);
            $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
            /*#endregion responsive code end*/
        };
    </script>
    <style>
    

        /*jssor slider loading skin spin css*/
        .jssorl-009-spin img {
            animation-name: jssorl-009-spin;
            animation-duration: 1.6s;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
        }

        @keyframes jssorl-009-spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .jssora061 {display:block;position:absolute;cursor:pointer;}
        .jssora061 .a {fill:none;stroke:#fff;stroke-width:360;stroke-linecap:round;}
        .jssora061:hover {opacity:.8;}
        .jssora061.jssora061dn {opacity:.5;}
        .jssora061.jssora061ds {opacity:.3;pointer-events:none;}
    </style>




<nav style="background: rgba(0,0,0,.8);height: 70px; font-size: 20px;"  class="navbar navbar-inverse">
  <div class="container-fluid">
  


    <div class="navbar-header">
      <a class="navbar-brand" href="#">Electronicus-Bibliotheca</a>
    </div>
    

    <ul  class="nav navbar-nav">
     
      <li class="active"><a href="mainhome.jsp">Home</a></li>
      
      <li><a href="about.jsp">About</a></li>

      <li><a href="http://localhost:4200/employees">Feedback</a></li>

     </ul>



    <ul class="nav navbar-nav navbar-right">
     

       <li   class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Login As<span class="caret"></span></a>
        <ul style="background: rgba(0,0,0,.8); font-size: 20px; " class="dropdown-menu">
          <li><a style="color: grey;" href="userlogin.jsp">User</a></li>
          <li><a style="color: grey;" href="adminlogin.jsp">Admin</a></li>
          
        </ul>
      </li>

     </ul>
    
  </div>
</nav>





<div class="container" style="margin-bottom: 80px;  font-weight: bold;">
  <div class="jumbotron">

     <h2 style="color:#c0cfc4; font-weight:bolder;">Electronicus-Bibliotheca</h2>

     <br>

    <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:980px;height:380px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="../includes/images/spin.svg" />
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:980px;height:380px;overflow:hidden;">
            <div>
                <img data-u="image" src="../includes/images/045.jpg" />
                <div u="thumb">E-Library
                </div>
            </div>
            <div>
                <img data-u="image" src="../includes/images/043.jpg" />
                <div u="thumb">E-Library
                </div>
            </div>
            <div>
                <img data-u="image" src="../includes/images/046.jpg" />
                <div u="thumb">E-Library
                </div>
            </div>
            <div>
                <img data-u="image" src="../includes/images/047.jpg" />
                <div u="thumb">E-Library
                </div>
            </div>
            <div>
                <img data-u="image" src="../includes/images/048.jpg" />
                <div u="thumb">E-Library
                </div>
            </div>
            <div>
                <img data-u="image" src="../includes/images/044.jpg" />
                <div u="thumb">E-Library
                </div>
            </div>
            <div>
                <img data-u="image" src="../includes/images/050.jpg" />
                <div u="thumb">E-Library
                </div>
            </div>
            <div>
                <img data-u="image" src="../includes/images/049.jpg" />
                <div u="thumb">E-Library
                </div>
            </div>
            <div>
                <img data-u="image" src="../includes/images/052.jpg" />
                <div u="thumb">E-Library
                </div>
            </div>
            <div>
                <img data-u="image" src="../includes/images/051.jpg" />
                <div u="thumb">E-Library
                </div>
            </div><a data-u="any" href="https://www.jssor.com" style="display:none">image gallery</a>
        </div>
        <!-- Thumbnail Navigator -->
        <div u="thumbnavigator" style="position:absolute;bottom:0px;left:0px;width:980px;height:50px;color:#FFF;overflow:hidden;cursor:default;background-color:rgba(0,0,0,.5);">
            <div u="slides">
                <div u="prototype" style="position:absolute;top:0;left:0;width:980px;height:50px;">
                    <div u="thumbnailtemplate" style="position:absolute;top:0;left:0;width:100%;height:100%;font-family:arial,helvetica,verdana;font-weight:normal;line-height:50px;font-size:16px;padding-left:10px;box-sizing:border-box;"></div>
                </div>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora061" style="width:55px;height:55px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <path class="a" d="M11949,1919L5964.9,7771.7c-127.9,125.5-127.9,329.1,0,454.9L11949,14079"></path>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora061" style="width:55px;height:55px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <path class="a" d="M5869,1919l5984.1,5852.7c127.9,125.5,127.9,329.1,0,454.9L5869,14079"></path>
            </svg>
        </div>
    </div>
    <script type="text/javascript">jssor_1_slider_init();
    </script>
    <!-- #endregion Jssor Slider End -->

</div>
</div>


<div class="container" style="margin-bottom: 120px;  font-weight: bold; color: white;">
  <div class="jumbotron">

<h3 style="color:#c0cfc4; font-weight: bolder;">Electronicus-Bibliotheca</h3>


<div class="row">
    
    <div class="col-md-4">
    	 <h3 style="color:#c0cfc4;">Overview</h3>
     <p>Electronicus-Bibliotheca is a library of over 10 free eBooks. Choose among free epub and Kindle eBooks, download them or read them online. You will find the great literature here, with focus on older works for which U.S. copyright has expired. Thousands of volunteers digitized and diligently proofread the eBooks, for enjoyment and education.</p>
    </div>

    <div class="col-md-4">
     <h3 style="color:#c0cfc4;">No fee or registration!</h3>
<p> Everything from Electronicus-Bibliotheca is gratis, libre, and completely without cost to readers. If you find Electronicus-Bibliotheca useful, please consider a small donation, to help Electronicus-Bibliotheca digitize more books, maintain our online presence, and improve Electronicus-Bibliotheca programs and offerings. Other ways to help include digitizing, proofreading and formatting, recording audio books, or reporting errors.</p>
</div>

    <div class="col-md-4">
    	<h3 style="color:#c0cfc4;">No special apps needed!</h3> 
<p>Electronicus-Bibliotheca eBooks require no special apps to read, just the regular Web browsers or eBook readers that are included with computers and mobile devices. There have been reports of sites that charge fees for custom apps, or for the same eBooks that are freely available from Electronicus-Bibliotheca. Some of the apps might have worthwhile features, but none are required to enjoy Electronicus-Bibliotheca eBooks</p>
   </div>

  </div>



</div>
</div>




<div class="footer">
  <p style="font-weight: bold; color:#c0cfc4;"> Copyright © 2019, All Rights Reserved </p>
</div>

</body>
</html>
