$(document).on('page:change', function(){
    initialize_page();
    addEditUserButtonEventListener();
    onEditUserAjaxSuccess();
})

function initialize_page(){
    $('.edit-form').hide();
    $('.save-user-button').hide();
}

function addEditUserButtonEventListener(){
    $('.edit-user-button').on('click', function(){
        $('.read-version').hide();
        $('.edit-form').show();
        $('.edit-user-button').hide();
        $('.save-user-button').show();
    });
}

function onEditUserAjaxSuccess(){
    $('form.edit_user').on('ajax:success', function(e, data, status, xhr ){
        $('.edit-form').hide();
        $('.read-version').show();
        $('#address')[0].innerHTML = data.updates.address
        $('#city-state')[0].innerHTML = data.updates.city+", "+data.updates.state
        $('#phone')[0].innerHTML = data.updates.phone
        $('#zipcode')[0].innerHTML = data.updates.zip
        $('.save-user-button').hide();
        $('.edit-user-button').show();
        var mapObject = $('iframe')[0];
        mapObject.src = "https://maps.google.com/maps?hl=en&q="+data.updates.address+" "+data.updates.city+" "+data.updates.state+" "+"&ie=UTF8&t=roadmap&z=15&iwloc=B&output=embed"
    });
}
