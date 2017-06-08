var refreshRating = function(){

  $('.rating').raty({
    path: '../images',
    scoreName: 'comment[rating]'
  });

  $('.rated').raty({
    path: '../images',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
};

$(document).on('turbolinks:load ajaxSuccess', function() {
  $(".alert").delay(600).fadeOut(800);

  refreshRating();

// I have two image zooms working one on the products page, the other on the product show page.
  $('.img-zoom1').elevateZoom({
    zoomType: "inner",
    cursor: "crosshair",
    zoomWindowWidth: 400,
    zoomWindowHeight:  400 
  });

  $('.img-zoom2').elevateZoom({
    zoomType: "lens",
    lensShape : "round",
    lensSize    : 200,
    cursor: "crosshair"
  });
});