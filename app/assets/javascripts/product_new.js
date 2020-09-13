$(document).on('turbolinks:load', function(){

  $(document).on('click', '.image_upload', function(){

    let preview = $('<div class="preview_box"><div class="upper-box"><img class="preview"></div><div class="lower-box"><div class="delete-box">削除</div></div></div>'); 
  
    function append_input(num){
      let  html = $(`<li class="input"><label class="upload-label"><div class="input-area"><input class="hidden image_upload" type="file" name="product[images_attributes][${num}][image]" id = "product_images_attributes_${num}_image"></div></div></label></li>`);
      return html;
    }

    $ul = $('#previews')
    $li = $(this).parents('li');
    $label = $(this).parents('.upload-label');
    $inputs = $ul.find('.image_upload');

    $('.image_upload').on('change', function (e) {

      let reader = new FileReader();
      
      // プレビューに追加させるために、inputから画像ファイルを読み込む。
      reader.readAsDataURL(e.target.files[0]);

      //画像ファイルが読み込んだら、処理が実行される。 
      reader.onload = function(e){

        $(preview).find('.preview').attr('src', e.target.result);
      }

      $li.append(preview);

      $label.css('display','none'); 
      $li.removeClass('input');
      $li.addClass('image-preview'); 
      $lis = $ul.find('.image-preview'); 
      $('#previews li').css({
        'width': `100px`
      })


      if($lis.length <= 4 ){
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width': `calc(100% - (20% * ${$lis.length}))`
        })
      }
      else if($lis.length == 5 ){
        $li.addClass('image-preview');
        $ul.append(append_input)
        $('#previews li:last-child').remove();
      }

      $inputs.each( function( num, input ){
        
        $(input).removeAttr('name');
        $(input).attr({
          name:"product[images_attributes][" + num + "][image]",
          id:"product_images_attributes_" + num + "_image"
        });
      });
    })
  })

  $(document).on('click','.delete-box',function(){
    let append_input = $(`<li class="input"><label class="upload-label"><div class="input-area"><input class="hidden image_upload" type="file" ></div></div></label></li>`)
    $ul = $('#previews')
    $lis = $ul.find('.image-preview');
    $input = $ul.find('.input');
    $ul = $('#previews')
    $li = $(this).parents('.image-preview');
  
  
    $li.remove();
  
    $lis = $ul.find('.image-preview');
    $label = $ul.find('.input');
    if($lis.length <= 4 ){
      $('#previews li:last-child').css({
        'width': `calc(100% - (20% * ${$lis.length}))`
      })
      // $ul.append(append_input)
    }
    else if($lis.length == 5 ){
      $('#previews li:last-child').css({
        'width': `100%`
      })
    }

  });
});
