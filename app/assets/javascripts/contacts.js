$('#contactsModal').on('show.bs.modal', function(e) {
    console.log('javascript modal');
    var contact_id = $(e.relatedTarget).data('contact-id');
    $(e.currentTarget).find('a[name="bookId"]').append('<p>'+contact_id+'</p>');
});