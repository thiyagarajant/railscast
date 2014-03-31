# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




#$(".like").hide();
change_star_image = (star_id, epi) ->
  i = 1

  while i < numStars + 1
    if i <= star_id
      val = i
      e = epi
      $("#rate" + i).attr "src", "/assets/star-on.png"
    else
      $("#rate" + i).attr "src", "/assets/star-off.png"
    i++
$(".reply").hide()
$(".feed").hide()
$(".comment_reply").click ->
  $(this).parent().next(".reply").show()

$(".rating").click ->
  $.ajax
    url: "/stars/rate?rating=" + val + "&episode_id=" + e
    type: "get"
    dataType: "html"
    processData: false
    success: (data) ->
      if data is "record_not_found"
        alert "Record not found"
      else
        $(this).val val
        cur_rate = $(this).val(val)


$(".key").hover ->
  $(this).addClass "btn-success"

$(".key").mouseout ->
  $(this).removeClass "btn-success"

$(".key").click ->
  $(".like").hide()
  $(".feed").show()

numStars = 5


