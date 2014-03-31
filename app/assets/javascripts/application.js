// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

   
      

$(".key").click(function(){
	e = $(".like").attr("text")
$(this).val() == 1 ? l = 1 : l = 0
$(this).val() == 1 ? unlike = 0 : unlike = 1
		 $.ajax({
		      url: '/like/index?episode_id=' + e + '&no_of_like=' + l + '&no_of_unlike=' + unlike , type: 'get', dataType: 'html',
		      processData: false,
		      success: function(data) {
		          if (data == "record_not_found") {
		              alert("Record not found");
		          }
		          else {     
		          		$(this).val(val) 
		          		cur_rate = $(this).val(val)  	
		          }
		      }
		  });
	})

    



$(".reply").hide();

$(".feed").hide();

$(".comment_reply").click(function() {
  return $(this).parent().next(".reply").show();
});

$(".rating").click(function() {
  $.ajax({
    url: "/stars/rate?rating=" + val + "&episode_id=" + e, type: "get", dataType: "html",
    processData: false,
    success: function(data) {
      if (data == "record_not_found") {
        alert("Record not found");
      } else {

        $(this).val(val);
       cur_rate = $(this).val(val);
      }
    }
  });
});

var change_star_image, numStars;
var e, i, val, _results;
change_star_image = function(star_id, epi) {
  
  i = 1;
  _results = [];
  while (i < numStars + 1) {
    if (i <= star_id) {
      val = i;
      e = epi;
      $("#rate" + i).attr("src", "/assets/star-on.png");
    } else {
      $("#rate" + i).attr("src", "/assets/star-off.png");
    }
    _results.push(i++);
  }
  return _results;
};



$(".key").hover(function() {
  return $(this).addClass("btn-success");
});

$(".key").mouseout(function() {
  return $(this).removeClass("btn-success");
});

$(".key").click(function() {
  $(".like").hide();
  return $(".feed").show();
});

numStars = 5;






