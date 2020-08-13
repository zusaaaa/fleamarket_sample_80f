let nextInput = (num, index)=> {
  let html = `<div class ="up-image__group__dropbox" data-index="${num}" index="${index}">
                <input class="product_images__default" type="file" multiple="multiple" accept= "image/*"></input></div>`;
  return html;
}
let previewImage = (src)=> {
  let html =`<div class = "preview preview_unsave">
              <div class = "image_box>
                <img src = "${src}" class = "preview_image"></div>
              <div class = "preview_btn">削除</div></div>`;
  return html;
}

$(document).on('change', 'input[type= "file"]', function(e){
  let render = new FileReader();
  let file = e.target.files[0];
  ReadableStreamReader.readAsDataURL(file);
  render.onload = function(e){
    if ($('.preview').length <= 4 {
      ($('.preview').append(previewImages(e.target.result));
    } else {
      $('.previews_2nd_row').append(previewImages(e.target.result));
    }
    let preview_count = $('.preview').length;
    let preview_unsave_count = $('.preview_unsave').length;
    let preview_save_count = $('.preview_saved').length;
    let preview_saved_count = $('.hidden-destroy').length;
    if (preview_count <= 5){
      $('.up-image__group__dropbox').removeClass('up-image__group__dropbox').addClass('image-preview').appendTo('.product_images');
    } else {
      $('.up-image__group__dropbox').removeClass('up-image__group__dropbox').addClass('image-preview').appendTo('.product_images_2nd_row');
    }
    if (preview_count <= 4) {
      $('.product_images').prepend(nextInput(preview_count + 1, preview_unsave_count + 1));
    } else {
    $('.product_images_2nd_row').prepend(nextInput(preview_count + 1, preview_unsave_count + 1));
    }
    if (preview_total_num == 5) {
      $('.product_images').css('display', 'none');
      $('.under_group').css('display', 'block');
      $('.product_images_2nd_row').css('display', 'block');
    }
    if (preview_total_num == 10) {
      $('.product_images_2nd_row').css('display', 'none');
    }
    $('.preview').each(function(i) {
      $(this).attr('data-index', (i+1));
    });
    $('.preview_unsave').each(function(i) {
      $(this).attr('index', (i+1));
    });
    $('.image-preview').each(function(i) {
      $(this).attr('index', (i+1));
      $(this).attr('data-index', (preview_save_count+i+1));
      $(this).children().attr('name', "product[product_images_attributes][" + (preview_saved_count+i) + "][src]");
      $(this).children().attr('data-index', (i+1));
    });
    }
  }
})
