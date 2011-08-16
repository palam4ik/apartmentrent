$(function(){
//    //$('.element').css('border', '1px solid black');
//    var original_height = $($('#d_menu .title')[0]).height();
//    $('#d_menu .title').mouseover(function(){
//        var $element = $(this).parent();
//
//        // close other
//        var $last_actives = $element.siblings().each(function(index, element){
//            var $other_element = $(element);
//            $other_element.find('.helper').hide();
//            $other_element.removeClass('active');
//            $other_element.css({height: original_height + 'px'});
//        });
//
//        if (!$element.hasClass('active'))
//        {
//            $element.addClass('active animation_start').
//                animate({height: '+=90px'}, 200, function(){
//                $element.css({height: '130px'});
//                $element.find('.helper').show('slow');
//                $element.removeClass('animation_start');
//                $element.addClass('active');
//            });
//        }

//    });

//    $('#d_menu .element').mouseout(function(){
//        //var $element = $(this).parent();
//        var $element = $(this);
//        console.log(this)
//        if (!$element.hasClass('animation_start') && $element.hasClass('active')) {
//            console.log('remove')
//            $element.find('.helper').hide();
//            $element.removeClass('active');
//            $element.css({height: original_height + 'px'});
//        }
//    });

$('#small-images img').click(
    function ()
      {
        var new_src = $(this).attr('src'),
            big_image = $('#big_image');

        new_src = new_src.replace('thumb_', '');

        console.log('new source: ' + new_src);

        big_image.attr('src', new_src);
      }
)







});