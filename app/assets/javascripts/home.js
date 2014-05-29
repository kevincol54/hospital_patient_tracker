

var getting_shit_done = function() {

  $('.notice').fadeIn().delay(3000).fadeOut('slow');

  var patient_validation = function() {
      $("input[type=submit]").attr("disabled", "disabled");
      $('input').on( 'keyup', function(){
        var validated = true;
        if($('#patient_name').length){
          if($('#patient_name').val().length < 2) validated = false;
          if(validated) {
            $("input[type=submit]").removeAttr("disabled");
          } else  {
            $("input[type=submit]").attr("disabled", "disabled");
          }
        } else if($('#hospital_name').length){
          if($('#hospital_name').val().length < 2) validated = false;
          if(validated) {
            $("input[type=submit]").removeAttr("disabled");
          } else  {
            $("input[type=submit]").attr("disabled", "disabled");
          }
        } else if($('#q').length){
          if($('#q').val().length < 3) validated = false;
          if(validated) {
            $("input[type=submit]").removeAttr("disabled");
          } else  {
            $("input[type=submit]").attr("disabled", "disabled");
          }
        } else if($('#doctor_name').length){
          if($('#doctor_name').val().length < 3) validated = false;
          if(validated) {
            $("input[type=submit]").removeAttr("disabled");
          } else  {
            $("input[type=submit]").attr("disabled", "disabled");
          }
        } else if($('#patient_ad_info').length){
          if($('#patient_ad_info').val().length < 3) validated = false;
          if(validated) {
            $("input[type=submit]").removeAttr("disabled");
          } else  {
            $("input[type=submit]").attr("disabled", "disabled");
          }
        }
          else {
          if($('#medicine_name').val().length < 2) validated = false;
          if(validated) {
            $("input[type=submit]").removeAttr("disabled");
          } else  {
            $("input[type=submit]").attr("disabled", "disabled");
          }
        }  
      }
    )};
    patient_validation()
  

  $(document.body).on("click", "a.change_workflow", function(){
    $.ajax({
      type: "PATCH",
      url: $(this).attr("patient_url"),
      dataType: "script"
    })
  });

  pageLength = 5;

  displayPage = function(page){
    $(".patients").hide();
    $(".patients").each(function(p){
      if(p >= pageLength * (page -1) && p < pageLength * page)
        $(this).show();
    });
  }

  displayPage(1);

  $(".pagelink a").click(function(){
    displayPage(parseInt($(this).text()))
  });
}

$(document).ready(getting_shit_done);
$(document).on("page:load", getting_shit_done);

