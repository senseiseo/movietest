// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels);


// $(document).on('click', '.js_create_ratings', function() {
//     var sale_manager = $(this).data("type");
//     var manager_id = $(this).data("id");
//     $.ajax({
//         url: Routes.ratings_create_path(),
//         type: "post",
//         data: { manager_id: manager_id, sale_manager: sale_manager },
//         success: function(data) {
//             $('.wr-btn_' + manager_id).html("");
//         },
//         error: function(data) {}
//     });
// });

document.getElementById('.js_create_ratings')
addEventListener('click', function(е) {
    е.preventDefault()
    console.log("hello");
    ajax({
        url: Routes.ratings_create_path(),
        type: "post",
        data: { manager_id: manager_id, sale_manager: sale_manager },
        success: function(data) {
            $('.wr-btn_' + manager_id).html("");
        },
        error: function(data) {}
    });
})