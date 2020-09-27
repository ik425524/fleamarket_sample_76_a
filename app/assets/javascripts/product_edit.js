$(document).on('turbolinks:load', function(){

  function preview(num, url){
    let html = $(`<div class="image-preview_box" data-index="${num}"><div class="wrapper-box"><img class="pre-image2" src="${url}" data-index="${num}"></div><div class="lower-box"><div class="delete-box">削除</div></div>`); 
    return html;
  }

  function editInput(num){
    let  html = $(`
  <input class="edit-upload add-upload" type="file" name="product[images_attributes][${num}][image]" id = "product_images_attributes_${num}_image" data-index="${num}">`);
    return html;
  }
  
  $firstImage = $('.pre-image').length;

  if($firstImage <= 4 ){
    $('.input').css({
      'width': `calc(100% - (20% * ${$firstImage}))`
    })
  }
  else if($firstImage == 5 ){
    $('.edit-file').hide();
  }


  // 新規投稿
  $('#previews').on('change', '.add-upload',function (e) {
    let file = e.target.files[0]
    let src = window.URL.createObjectURL(file);

    let reader = new FileReader();
    reader.readAsDataURL(file);    
    
    $targetIndex = $(this).data('index');
    $lis = ($targetIndex + 1);

    let count = $('.image-preview_box').length;
    let counts = (count + 1);

    $ul = $('#previews')
    $li = $(this).parents('li');
    $li.before(preview($targetIndex, src));
    console.log($lis);
    if(counts <= 4 ){
      $('.add-area').before(editInput($lis))
      $('.input').css({
        'width': `calc(100% - (20% * ${counts}))`
      })
    }
    else if(counts == 5 ){
      $('.input').hide();
    }
  });


  // 編集ボタンの処理
  $('.image-preview_box').on('click', '.edit-box', function(){
    $targetIndex = $(this).parent().parent().data('index');

    $(this).parent().parent().remove();
    $(`img[data-index="${$targetIndex}"]`).remove();
    // console.log($targetIndex);
    // $lis = ($targetIndex + 1);

    let count = $('.image-preview_box').length;
    let counts = (count + 1);

    if(count <= 4 ){
      console.log(count);
      $('.add-area').before(editInput($targetIndex));
      $('.edit-file').show();
      $('.input').css({
        'width': `calc(100% - (20% * ${count}))`
      })
    }else if(counts == 5){
      console.log(counts);
      $('.input').hide();
    }
  });


  // 削除ボタンの処理
  $(".image-preview_box").on('click','.update-delete_box',function(){
      // チェックボックスの処理
      let targetIndex = $(this).parent().parent().data('index')

      let hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      if (hiddenCheck) hiddenCheck.prop('checked', true);

      // プレビューの削除
      $(this).parent().parent().remove();
      $(`img[data-index="${targetIndex}"]`).remove();
      
      $count = $('.pre-image').length;

      if($count == 4){
        $('.edit-file').show();
        $('.input').css({
          'width' : `calc(100% - (20% * ${$count}))`
        })
      }else if($count <= 3){
        $('.add-upload').after(editInput($count));
        $('.input').css({
          'width' : `calc(100% - (20% * ${$count}))`
        })
      }else if($count == 5){
        ('.edit-upload').hide();
      }
  });
  
});

