$(document).on('turbolinks:load', function() {

  // 画像アップロードの処理。
  // 画像アップエリアをクリックすると、非同期で画像を保存するようにしている。
  // 最終的にアイテムを出品する時にその時表示されている画像にitem_idを結びつけるようにしている。
  function image_upload_box_ON_OFF(){
    if ($('.upload_image_box--img li').length == 4){
      $('.upload_image_box--text').hide()}
      else{$('.upload_image_box--text').show()}
  }

  function buildHTML(image){
    var html =`<li id="image_list">
              <div class="upload_image_box--img--image middle" >
              <img src="${image.image}">
              </div>
              <div class="upload_image_box--img--buttun">
              <a class="middle-center" id="image_henshu">編集</a>
              <a class="middle-center" id="image_delete">削除</a>
              <input required="required" id="images_ids" style="display:none" value="${image.id}" name="item[images_ids][]">
              </div>
              </li>`
      return html;
    };

  $('.upload_image_box--text').on('click', function(e){
    $('#image_uploader').click()
  })

  $('#image_uploader').on('change', function(e){
    $('.main__exhibit__image').submit()
  })

  $('.main__exhibit__image').submit(function(e){
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      url: "/images",
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.upload_image_box--img').append(html)
      $('#image_uploader').val("")
      image_upload_box_ON_OFF()
    })
    .fail(function(data){
      console.log("fail")
    })
    .always(function(data){
      $("#image_submit").prop('disabled', false);
    });
  })

  // 画像削除ボタンの処理
  // 備考：
  // ここで非同期でDBから削除しようかと思ったが悪用できる可能性があるのでやめた
  $(document).on('click','#image_delete',function(e){
    $(this).parent().parent().remove()
    image_upload_box_ON_OFF()
  })



})
