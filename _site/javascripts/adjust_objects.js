$(document).ready(function () {
  var entries = $("div.entry");
  if (entries.length > 0) {
    $(".video object").each(function () {
      Adjustment.adjustSize(this);
    });
    $(".video embed").each(function () {
      Adjustment.adjustSize(this);
    });
  }

});

var Adjustment = {
  'adjustSize' : function (obj) {
    var actualWidth = $(obj).width();
    if (actualWidth === 0) return;

    var width = obj.width ? obj.width : 1;
    var height = obj.height ? obj.height : 1;
    var ratio = actualWidth / width;

    obj.width = actualWidth;
    obj.height = Math.floor(obj.height * ratio);
  }
};
