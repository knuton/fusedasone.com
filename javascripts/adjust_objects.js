$(document).ready(function () {
  var entries = $("div.entry");
  if (entries.length > 0) {
    var containerWidth = parseInt($("div.entry").css("width"));
    $("object.adjust").each(function () {
      Adjustment.adjustSize(this, containerWidth);
    });
    $("embed.adjust").each(function () {
      Adjustment.adjustSize(this, containerWidth);
    });
  }

});

var Adjustment = {
  'adjustSize' : function (obj, newWidth) {
    var width = obj.width ? obj.width : 1;
    var height = obj.height ? obj.height : 1;
    var ratio = newWidth / width;

    obj.width = newWidth;
    obj.height = Math.floor(obj.height * ratio);
  }
};
