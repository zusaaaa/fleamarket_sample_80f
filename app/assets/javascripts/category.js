$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  } 
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                        <select class="listing-select-wrapper__box--select form-input" id="child_category" name="product[category_id]">
                          <option value="---" data-category="---">---</option>
                          ${insertHTML}
                        <select>
                      </div>`;
    $('.productForm__category').append(childSelectHtml);
  }
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
                              <select class="listing-select-wrapper__box--select form-input" id="grandchild_category" name="product[category_id]">
                                <option value="---" data-category="---">---</option>
                                ${insertHTML}
                              </select>
                            </div>`;
    $('.productForm__category').append(grandchildSelectHtml);
  }
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != 1){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  $('.productForm__category').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != 1){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });
});

$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChild(insertHTML) {
    var childSelectHTML = '';
    childSelectHTML = ` <div class="listing-select-wrapper--edit__child">
                          <select class="listing-select-wrapper--edit__child--select" id="child_category_edit" name="">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>`;
    $('.listing-select-wrapper--edit').append(childSelectHTML);
  }
  function appendGrandChild(insertHTML) {
    var grandChildSelect = '';
    grandChildSelect = `<div class="listing-select-wrapper--edit__grandchild">
                          <select class="listing-select-wrapper--edit__grandchild--select" id="grandchild_category_edit" name="product[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>`;
    $('.listing-select-wrapper--edit').append(grandChildSelect);
  }
  $('#parent_category_edit').on('change', function() {
    var parentCategoryEdit = document.getElementById('parent_category_edit').value;
    if (parentCategoryEdit != 1){
      $.ajax({
        url: '/products/get_category_children',
        type: 'GET',
        data: { parent_id: parentCategoryEdit },
        dataType: 'json'
      })
      .done(function(children){
        $('.listing-select-wrapper--edit__child').remove();
        $('.listing-select-wrapper--edit__grandchild').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChild(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else {
      $('#child_category_edit').remove();
      $('#grandchild_category_edit').remove();
    }
  });
  $('.listing-select-wrapper--edit').on('change', '#child_category_edit', function(){
    var childIdEdit = document.getElementById('child_category_edit').value;
    console.log(childIdEdit)
    if (childIdEdit != 1) {
      $.ajax({
        url: '/products/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childIdEdit },
        dataType: 'json'
      })
      .done(function(grandchildren) {
        if (grandchildren.length != 0) {
          $('#grandchild_category_edit').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandChild(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else {
      $('#grandchild_category_edit').remove();
    }
  })
})


