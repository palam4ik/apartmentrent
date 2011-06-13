$(function(){
  var add_image_button = $('#add_image_button'),
      image_placeholder = $('#image_placeholder');

  function get_upload_image_form(i) {
    var str = '<div class="field">' + 
              '<label for="apartment_photos_attributes_' + i + '_files">File</label>' + 
              '<br />' + 
              '<input id="apartment_photos_attributes_' + i + '_files" name="apartment[photos_attributes][' + i + '][file]" type="file">' + 
              '</div>';  
    $('#image_button_upload').append(str);
  }
  // проверяем есть ли этот объект на самом деле на странице
  if (add_image_button.length > 0)
  {
    add_image_button.click(function(event){
      var images_count = image_placeholder.children().length,
          files_count = $('#image_button_upload').children().length;
      get_upload_image_form(images_count + files_count);
    });
  }
});
