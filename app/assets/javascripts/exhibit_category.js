// カテゴリ階層処理
$(document).on('turbolinks:load', function() {
  function category_append(){
      var html = `<div class="select_box" id="select_box">
<i class="fa fa-angle-down exhibit"></i>
<select class="exhibit_select_category exhibit_select" required="required" name="item[category_id]"><option value="">---</option>
</div>`
      $("#category_box").append(html)
    }



  $(document).on('change','.exhibit_select_category',function(e){
    var chosed_category = $(this).val()
    $(this).parent().nextAll('.select_box').remove()
    $('.exhibit_select_size').children().remove()
    if (chosed_category == "") {}
    else{
    $.ajax({
      url: 'category/search',
      type: "POST",
      data: {parent_id:chosed_category},
      dataType: 'json',
    })
    .done(function(data){
      if(data.categories == ""){}
      else{
        // カテゴリーボックスを作り、中に次のカテゴリー候補を入れている
        category_append()
        var add_box = document.getElementById("category_box")
        $.each(data.categories,function(i,category){
          var op = document.createElement("option");
          op.value =category.id
          op.text = category.name
          add_box.lastChild.lastChild.append(op)
        });
      }
      if(data.size == ""){$('.size').css('display', 'none')}
      else{
        $('.size').css('display', 'block')
        var op_blank = document.createElement("option");
          op_blank.value =""
          op_blank.text = "---"
        $('.exhibit_select_size').append(op_blank)
        $.each(data.size,function(i,size){
          var op = document.createElement("option");
          op.value =size.id
          op.text = size.size
          $('.exhibit_select_size').append(op)
        });
      }
    })
    .fail(function(data){
      alert('error');
    })
    }
  })
})
