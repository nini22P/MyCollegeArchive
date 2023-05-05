$(function () {
  var stalker = $("#stalker");
  let hoverFix = false;
  $(document).on("mousemove", function (e) {
    if (hoverFix == false) {
      stalker.css({
        transform: "translate(" + e.clientX + "px, " + e.clientY + "px)",
      });
    }
  });

  $(document)
    .on("mouseenter", "a:not(.notSt)", function () {
      hoverFix = true;
      let x = $(this).offset().left - 2;
      let y = $(this).offset().top - $(window).scrollTop() - 2;
      let stwidth = $(this).innerWidth();
      let stheight = $(this).innerHeight();
      stalker.addClass("hov_ mov");
      $(".mov").css({
        width: stwidth + "px",
        height: stheight + "px",
        transform: "translate(" + x + "px, " + y + "px)",
      });
    })
    .on("mouseleave", "a", function (e) {
      stalker.css({
        transform: "translate(" + e.clientX + "px, " + e.clientY + "px)",
      });
      $(".mov").css({ width: "16px", height: "16px" });
      stalker.removeClass("hov_ mov");
      hoverFix = false;
    });
});
