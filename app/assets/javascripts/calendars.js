$(function(){
    $(".events").addClass("hide");
    $(".btn").click(function(){
        if($(".events").hasClass("hide")){
            $(".events").removeClass("hide");
            $(".btn").text("Hide Events");
        }
        else{
            $(".events").addClass("hide");
            $(".btn").text("Show Events");
        }
    })
})