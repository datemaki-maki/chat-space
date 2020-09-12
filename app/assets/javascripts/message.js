$(function(){
  function buildHTML(message){
  if ( message.image ) {
      let html =
      `<div class="main-message">
      <div class="main-message__list">
        <div class="main-message__list__name">
          ${message.user_name}
        </div>
        <div class="main-message__list__date">
          ${message.created_at}
        </div>
      </div>
      <div class="main-message__comment">
        <p class="Message__content">
        ${message.content}
        </p>
        <img class="Message__image" src="${message.image}">
      </div>
    </div>`
  return html;
  } else {
    let html =
    `<div class="main-message">
    <div class="main-message__list">
      <div class="main-message__list__name">
        ${message.user_name}
      </div>
      <div class="main-message__list__date">
        ${message.created_at}
      </div>
    </div>
    <div class="main-message__comment">
      <p class="Message__content">
      ${message.content}
      </p>
    </div>
  </div>`
    return html;
  };
  }

  $('.main-form__message').on('submit', function(e){
    e.preventDefault()
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(message){
      let html = buildHTML(message);
      // console.log(html)
      $('.main-messages').append(html);
      $('.main-messages').animate({ scrollTop: $('.main-messages')[0].scrollHeight});
      $('form')[0].reset();
      $(".submit-btn").prop("disabled", false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
  });
});
